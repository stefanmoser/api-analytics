require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra:Application
  end

  def my_first_test
    post '/login/requests', :url => 'foo', :http_method => 'bar'
    assert_equal 200, last_response.status
  end
end