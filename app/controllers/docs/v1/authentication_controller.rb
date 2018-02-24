# frozen_string_literal: true

class Docs::V1::AuthenticationController
  include Swagger::Blocks

  swagger_path "/user_token" do

    operation :post do
      key :description, "get a token by registered user"
      key :operationId, "getToken"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Auth"
      ]
      parameter do
        key :in, :body
        key :name, :auth
        key :description, "Get a token from auth"
        key :required, true
        schema do
          key :'$ref', :Authentication
        end
      end

      response 200 do
        key :description, "auth response"
        schema do
          key :'$ref', :AuthResponse
        end
      end
    end
  end
end
