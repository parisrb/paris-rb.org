require "test_helper"

class TalksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talk = talks(:one)
    @talk.preferred_month_talk = Talk.propose_upcoming_months.keys.sample
  end

  test "should get new" do
    get new_talk_path
    assert_response :success
  end

  test "should get index" do
    get talks_path
    assert_response :success
  end

  test "should create talk, notify the user and send a slack notification" do
    stamp = stamp_from_new_form
    travel human_fill_time

    assert_enqueued_jobs 2 do
      assert_difference("Talk.count") do
        post talks_url, params: { talk: talk_attributes, form_stamp: stamp }
      end
    end

    assert_equal "SlackNotificationJob", ActiveJob::Base.queue_adapter.enqueued_jobs.last["job_class"]

    perform_enqueued_jobs
    mail = ActionMailer::Base.deliveries.last
    assert_equal "[Paris.rb] New Talk: #{@talk.title}", mail["subject"].to_s

    assert_redirected_to talks_path
  end

  test "the form carries a honeypot field and a signed stamp" do
    get new_talk_path

    assert_select "input[name=?][tabindex=?][autocomplete=?]", "color", "-1", "off"
    assert_not_empty css_select("input[name='form_stamp']").first["value"]
  end

  test "should detect bots with an honeypot field" do
    stamp = stamp_from_new_form
    travel human_fill_time

    assert_no_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes, form_stamp: stamp, color: "honey" }
    end

    assert_redirected_to root_path
  end

  # Le cas courant : du spam qui poste directement sur l'endpoint avec des
  # params récupérés d'avance, sans jamais charger le formulaire.
  test "should reject a submission that never fetched the form" do
    assert_no_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes }
    end

    assert_redirected_to root_path
  end

  test "should reject a submission whose stamp we did not sign" do
    assert_no_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes, form_stamp: "#{Time.current.to_i}--forged" }
    end

    assert_redirected_to root_path
  end

  test "should reject a submission whose stamp is not a string" do
    assert_no_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes, form_stamp: [ "a", "b" ] }
    end

    assert_redirected_to root_path
  end

  test "should reject a form filled in faster than a human could" do
    stamp = stamp_from_new_form

    assert_no_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes, form_stamp: stamp }
    end

    assert_redirected_to root_path
  end

  # Un stamp se dépense à remplir le formulaire, pas à le réussir du premier
  # coup : corriger une erreur et renvoyer aussitôt, c'est humain.
  test "should keep the stamp when the form comes back on a validation error" do
    stamp = stamp_from_new_form
    travel human_fill_time

    assert_no_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes(title: ""), form_stamp: stamp }
    end
    assert_response :success
    assert_equal stamp, css_select("input[name='form_stamp']").first["value"]

    assert_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes, form_stamp: stamp }
    end
    assert_redirected_to talks_path
  end

  # Sans borne, un stamp récupéré une fois se rejoue pour toujours et ne vaut
  # pas mieux qu'une constante cachée dans le formulaire.
  test "should reject a form left open for longer than a day" do
    stamp = stamp_from_new_form
    travel Captcha::MAX_FORM_AGE + 1.minute

    assert_no_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes, form_stamp: stamp }
    end

    assert_response :success
    assert_select ".alert", text: I18n.t("talks.form.expired_stamp")
    assert_select "#talk_title[value=?]", @talk.title
  end

  # Renvoyer le stamp périmé dans le formulaire enfermerait la personne dans
  # une boucle de rejets.
  test "an expired form comes back with a stamp that works" do
    stamp = stamp_from_new_form
    travel Captcha::MAX_FORM_AGE + 1.minute
    post talks_url, params: { talk: talk_attributes, form_stamp: stamp }

    fresh_stamp = css_select("input[name='form_stamp']").first["value"]
    assert_not_equal stamp, fresh_stamp

    travel human_fill_time
    assert_difference("Talk.count") do
      post talks_url, params: { talk: talk_attributes, form_stamp: fresh_stamp }
    end
    assert_redirected_to talks_path
  end

  # Le stamp n'empêche pas le rejeu, il le borne. Ce plafond est ce qui limite
  # ce qu'un bot ayant récupéré un stamp valide peut envoyer.
  test "should refuse a flood of proposals from the same address" do
    TalksController::MAX_PROPOSALS_PER_HOUR.times do |index|
      submit_talk(title: "Talk #{index}")
      assert_redirected_to talks_path
    end

    assert_no_difference("Talk.count") do
      submit_talk
    end
    assert_redirected_to root_path
  end

  test "should log blocked submissions" do
    logs = capture_logs do
      post talks_url, params: { talk: talk_attributes }
    end

    assert_match(/\[Captcha\] Blocked talks#create: never_fetched/, logs)
  end

  private

  def talk_attributes(**overrides)
    @talk.attributes.except("id", "created_at", "updated_at").merge(overrides.stringify_keys)
  end

  def stamp_from_new_form
    get new_talk_path
    css_select("input[name='form_stamp']").first["value"]
  end

  def submit_talk(**overrides)
    stamp = stamp_from_new_form
    travel human_fill_time
    post talks_url, params: { talk: talk_attributes(**overrides), form_stamp: stamp }
  end

  def human_fill_time
    Captcha::MIN_FILL_TIME + 1.second
  end

  def capture_logs
    output = StringIO.new
    previous_logger = Rails.logger
    Rails.logger = ActiveSupport::Logger.new(output)
    yield
    output.string
  ensure
    Rails.logger = previous_logger
  end
end
