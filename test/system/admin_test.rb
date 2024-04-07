# require "application_system_test_case"

# class AdminTest < ApplicationSystemTestCase
#   setup do
#     @admin = users(:admin)
#   end

#   test "sign in admin and visit the admin" do
#     visit rails_admin.dashboard_path
#     fill_in "user[email]", with: @admin.email
#     fill_in "user[password]", with: "password"
#     click_on "Me connecter"
#     assert_selector "h1", text: "Administration"
#   end

#   class AuthenticatedAdminTest < ApplicationSystemTestCase
#     setup do
#       login_as users(:admin), scope: :user
#     end

#     test "visit the sponsors" do
#       visit rails_admin.index_path("sponsor")
#       assert_selector "h1", text: "Liste des Sponsor"
#     end

#     test "visit the videos" do
#       visit rails_admin.index_path("video")
#       assert_selector "h1", text: "Liste des Video"
#     end

#     test "visit the talks" do
#       visit rails_admin.index_path("talk")
#       assert_selector "h1", text: "Liste des Talk"
#     end
#   end
# end
