
require "application_system_test_case"

class HomePageSystemTest < ApplicationSystemTestCase
  # write system test for static pages /code-of-conduct and communique/thibault-assus
  # visit the page and assert a content

  # write system test for static pages /code-of-conduct and communique/thibault-assus
  test "visit code of conduct" do
    visit "/code_de_conduite"
    assert_text "code de conduite"
  end
end
