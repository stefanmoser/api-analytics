require 'sinatra'
require 'sinatra/reloader'
require 'mongoid'

load 'api_request.rb'

configure do
   Mongoid.configure do |config|
    name = "demo"
    host = "localhost"
    config.master = Mongo::Connection.new.db(name)
  end
end

get '/:api/requests' do
  api_requests = ApiRequest.all

  response = ""
  api_requests.each do |api_request|
    response += api_request.url + "\n"
  end

  response
end

post '/:api/requests' do
  api_request = ApiRequest.new(:url => params[:url], :method => params[:http_method])
  api_request.save

  "all done"
end