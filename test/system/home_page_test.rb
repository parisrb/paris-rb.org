require "application_system_test_case"

class HomePageSystemTest < ApplicationSystemTestCase
  setup do
    @active_sponsor = sponsors(:one)
    @permanent_sponsor = sponsors(:permanent)
  end

  test "Update the session count" do
    visit root_path
    assert_text "Le plus grand meetup Ruby d'Europe", normalize_ws: true
    assert_selector ".section-sponsors img", count: 4
    assert_selector "[alt='#{@active_sponsor.name}']", count: 1
    assert_selector "[alt='#{@permanent_sponsor.name}']", count: 1
  end
end
