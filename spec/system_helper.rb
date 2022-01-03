# Load general RSpec Rails configuration
require "rails_helper.rb"

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.server_port = 3001
  config.server = :puma, { Silent: true }
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    # Tests are headless by default, if you need to see the browser you can run..
    # > HEADLESS=false bin/rspec
    #
    if !ENV["HEADLESS"].in?(%w[n 0 no false])
      driven_by :selenium_chrome_headless
    else
      driven_by :selenium_chrome
    end
  end
end
