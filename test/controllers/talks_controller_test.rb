require "test_helper"

class TalksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talk = talks(:one)
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
      @talk.preferred_month_talk = Talk.propose_upcoming_months.keys.sample
      assert_enqueued_jobs 2 do
        assert_difference("Talk.count") do
          post talks_url, params: { talk: @talk.attributes.except("id", "created_at", "updated_at") }
        end
      end

    assert_equal "SlackNotificationJob", ActiveJob::Base.queue_adapter.enqueued_jobs.last["job_class"]

    perform_enqueued_jobs
    mail = ActionMailer::Base.deliveries.last
    assert_equal "[Paris.rb] New Talk: #{@talk.title}", mail["subject"].to_s

    assert_redirected_to talks_path
  end
end
