require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: ENV.fetch("DRIVER", :headless_chrome).to_sym, screen_size: [1400, 1400]
end
