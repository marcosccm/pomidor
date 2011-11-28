$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "pomidor"
require "rubygems"
require "bundler"
Bundler.setup(:default, :test)
require "grape"
require "rack/test"
require "multi_json"
require "redis"
require "main"

$redis = Redis.new

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.after do
    $redis.flushall
  end
end


def app
  Pomidor::API
end
