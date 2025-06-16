require "test_helper"

class RedirectionControllerTest < ActionDispatch::IntegrationTest
  test "should redirect /redirection/slack to Slack URL with status 308" do
    get "/redirection/slack"
    assert_redirected_to JOIN_SLACK_URL
    assert_response :permanent_redirect
  end
end
