require 'test_helper'

class TalksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talk = talks(:one)
  end

  test "should get index" do
    get talks_url
    assert_response :success
  end

  test "should create talk, notify the user and send a slack notification" do
    assert_difference('Talk.count') do
      post talks_url, params: { talk: @talk.attributes.except('id', 'created_at', 'updated_at') }
    end
    mail = ActionMailer::Base.deliveries.last
    assert_equal @talk.speaker_email, mail['to'].to_s

    assert_redirected_to talks_url(anchor: :talks)
  end
end
