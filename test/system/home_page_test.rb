require "application_system_test_case"

class HomePageSystemTest < ApplicationSystemTestCase
  test "Update the session count" do
    visit root_path
    assert_text "Le plus grand meetup Ruby d'Europe", normalize_ws: true
    assert_selector ".section-sponsors img", count: 4
  end
end
