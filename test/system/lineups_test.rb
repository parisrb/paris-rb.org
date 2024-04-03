require "application_system_test_case"

class LineupsTest < ApplicationSystemTestCase
  test "visiting the lineup" do
    visit lineup_path
    assert_selector "h2", text: "PARISRB <3"
    refute_selector "h2", text: "Talks <3"
  end
end
