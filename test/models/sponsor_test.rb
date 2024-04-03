require "test_helper"

class SponsorTest < ActiveSupport::TestCase
  setup do
    @sponsor_permanent = sponsors(:permanent)
  end

  test "Current sponsor includes permanent" do
    assert Sponsor.current.include?(@sponsor_permanent)
  end
end
