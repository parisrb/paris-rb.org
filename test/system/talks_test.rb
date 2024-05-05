require "application_system_test_case"

class TalksTest < ApplicationSystemTestCase
  test "visit talks" do
    visit talks_path
    assert_selector "h1", text: I18n.t("talks.index.lineup")
  end

  test "visit talks in english" do
    visit talks_path(locale: :en)
    assert_selector "h1", text: I18n.t("talks.index.lineup", locale: :en)
  end



  test "new talk" do
    visit new_talk_path
    assert_difference "Talk.count" do
      fill_in "talk_title", with: "New talk"
      fill_in "talk_speaker_name", with: "John Doe"
      fill_in "talk_speaker_email", with: "test@example.com"
      fill_in "talk_speaker_twitter", with: "@johndoe"
      select "Long - 20 min", from: "talk_duration"
      select "Moyen", from: "talk_level"
      select Talk.propose_upcoming_months.values.sample, from: "talk_preferred_month_talk"
      click_on "submit-talk"
      assert_text "Talk proposed successfully"
    end
  end

  test "new talk in english" do
    visit new_talk_path(locale: :en)
    assert_selector "h1", text: I18n.t("talks.new.title", locale: :en)

    assert_difference "Talk.count" do
      fill_in "talk_title", with: "New talk"
      fill_in "talk_speaker_name", with: "John Doe"
      fill_in "talk_speaker_email", with: "test@example.com"
      fill_in "talk_speaker_twitter", with: "@johndoe"
      select "Long - 20 min", from: "talk_duration"
      select "Intermediate", from: "talk_level"
      select I18n.t(Talk.propose_upcoming_months.keys.sample, scope: "activerecord.attributes.talk.proposed_months", locale: :en), from: "talk_preferred_month_talk"
      click_on "submit-talk"
      assert_text "Talk proposed successfully"
    end
  end
end
