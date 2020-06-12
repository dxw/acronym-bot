require 'rack/test'
require 'slack-ruby-client'
require_relative '../lib/acronym_bot.rb'

module RspecHelper
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include RspecHelper
end
