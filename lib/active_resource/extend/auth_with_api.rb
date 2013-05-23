module ActiveResource #:nodoc:
  module Extend
    module AuthWithApi
      module ClassMethods
        def element_path_with_auth(*args)
          element_path_without_auth(*args).concat("&access_token=#{self.api_key}")
        end
        def new_element_path_with_auth(*args)
          new_element_path_without_auth(*args).concat("&access_token=#{self.api_key}")
        end
        def collection_path_with_auth(*args)
          collection_path_without_auth(*args).concat("&access_token=#{self.api_key}")
        end
      end

      def self.included(base)
        base.class_eval do
          extend ClassMethods
          cattr_reader :api_key
          class << self
            @@api_key = Token.api_key
            alias_method_chain :element_path, :auth
            alias_method_chain :new_element_path, :auth
            alias_method_chain :collection_path, :auth
          end
        end
      end  
    end
  end  
end
