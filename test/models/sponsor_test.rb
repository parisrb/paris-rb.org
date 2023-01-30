require 'test_helper'

class SponsorTest < ActiveSupport::TestCase

  setup do
    @sponsor = sponsors(:one)
    @sponsor_permanent = sponsors(:permanent)
  end

  test "active sponsor" do
    assert @sponsor.active?
    assert @sponsor_permanent.active?
  end
end
