require "test_helper"

class TalkTest < ActiveSupport::TestCase
  test "next_meetup_date next month" do
    # Travel to April 24, 2024
    travel_to Date.new(2024, 4, 24) do
      assert_equal Date.new(2024, 5, 7), Talk.next_meetup_date
    end
  end

  test "next_meetup_date current month" do
    # Travel to May 1, 2024
    travel_to Date.new(2024, 5, 1) do
      assert_equal Date.new(2024, 5, 7), Talk.next_meetup_date
    end
  end
end
