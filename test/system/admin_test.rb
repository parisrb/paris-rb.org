require "application_system_test_case"

class AdminTest < ApplicationSystemTestCase
  setup do
    @admin = users(:admin)
  end

  test "only authenticated admin can access" do
    visit avo.resources_users_path
    assert_current_path new_user_session_path
  end

  class AuthenticatedAdminTest < ApplicationSystemTestCase
    setup do
      login_as users(:admin), scope: :user
    end

    test "visit the sponsors" do
      visit avo.resources_sponsors_path
      assert_selector "[data-target='title'] span", text: "Sponsors"
    end

    test "visit the videos" do
      visit avo.resources_videos_path
      assert_selector "[data-target='title'] span", text: "Videos"
    end

    test "visit the talks" do
      visit avo.resources_talks_path
      assert_selector "[data-target='title'] span", text: "Talks"
    end
  end
end
