require 'rack/test'
require 'slack-ruby-client'
require 'webmock/rspec'
require_relative '../lib/acronym_bot.rb'
WebMock.disable_net_connect!(allow_localhost: true)

module RspecHelper
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include RspecHelper
end
