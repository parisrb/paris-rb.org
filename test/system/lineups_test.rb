require "application_system_test_case"

class LineupsTest < ApplicationSystemTestCase
  test "visiting the lineup" do
    visit lineup_path
    assert_selector "div", text: "Paris"
    refute_selector "div", text: "Talks"
  end
end
