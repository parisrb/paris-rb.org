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

  test "display the home page and track visits" do
    visit root_path

    assert_selector "#sponsors img", count: 4
    assert_selector "[alt='#{I18n.t("sponsors.card.sponsor_logo", name: @active_sponsor.name)}']", count: 1
    assert_selector "[alt='#{I18n.t("sponsors.card.sponsor_logo", name: @permanent_sponsor.name)}']", count: 1
    assert_equal 1, Ahoy::Visit.count
    assert_equal 1, Ahoy::Event.count
  end


  test "display the home page in english" do
    with_locale(:en) do
      visit root_path

      assert_selector "h1", text: "Paris.rb"
    end
  end
end
