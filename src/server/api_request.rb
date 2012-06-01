require 'mongoid'

class ApiRequest
  include Mongoid::Document

  field :url
  field :method
end