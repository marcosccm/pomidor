$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "pomidor"
require "rubygems"
require "bundler"
Bundler.setup(:default, :test)
require "grape"
require "rack/test"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Pomidor::API
end
