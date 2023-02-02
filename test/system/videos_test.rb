require "application_system_test_case"

class VideosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit videos_url
    assert_selector "h1", text: I18n.t('videos.index.title')
  end
end
