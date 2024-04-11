require "application_system_test_case"

class HomePageSystemTest < ApplicationSystemTestCase
  setup do
    @active_sponsor = sponsors(:one)
    @permanent_sponsor = sponsors(:permanent)
    Sponsor.all.each do |sponsor|
      file = Rails.root.join("test", "fixtures", "files", "logo.png").open
      sponsor.logo.attach(io: file, filename: "logo.png", content_type: "image/png")
    end
  end

  test "Update the session count" do
    visit root_path

    assert_selector "#sponsors img", count: 4
    assert_selector "[alt='#{I18n.t("sponsors.card.sponsor_logo", name: @active_sponsor.name)}']", count: 1
    assert_selector "[alt='#{I18n.t("sponsors.card.sponsor_logo", name: @permanent_sponsor.name)}']", count: 1
  end
end
