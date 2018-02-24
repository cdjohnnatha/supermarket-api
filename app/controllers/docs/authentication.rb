# frozen_string_literal: true

class Docs::Authentication
  include Swagger::Blocks

  swagger_schema :Authentication do
    property :auth do
      property :email do
        key :type, :string
      end
      property :password do
        key :type, :string
      end
      key :format, :object
    end
  end

  swagger_schema :AuthResponse do
    property :jwt do
      key :type, :string
    end
  end
end
