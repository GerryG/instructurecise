class Token < ActiveResource::Base

  self.site = "http://canvas-api.herokuapp.com/api/v1"

  class << self
    def api_key
      @@api_key ||= Token.create.token
    end
  end
end
