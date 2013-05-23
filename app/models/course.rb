
require 'active_resource/extend/auth_with_api'

class Course < ActiveResource::Base
  include ActiveResource::Extend::AuthWithApi

  self.site = "http://canvas-api.herokuapp.com/api/v1"

  add_response_method :http_response

  schema do
    string  :json_class
    integer :id
    string  :name
    string  :code
    string  :description
    date    :start_at
    date    :end_at
    date    :created_at
    date    :updated_at
  end

  def course_response
  end
end
