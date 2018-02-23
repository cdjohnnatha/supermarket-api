# frozen_string_literal: true

module Api::V1
  class DocsController < ApiController
    skip_before_action :authenticate_user
    include Swagger::Blocks

    swagger_root do
      key :swagger, "2.0"
      info do
        key :version, "1.0.0"
        key :title, "Swagger Docs supermarket API"
        key :description, "Documentation for directional boring api "
        key :termsOfService, "http://helloreverb.com/terms/"
        contact do
          key :name, "Supermarket API"
        end
        license do
          key :name, "MIT"
        end
      end
      tag do
        key :name, "Supermarket API"
        key :description, "Supermarket API operations"
      end
      key :host, "localhost:3000"
      key :basePath, "/v1"
      key :consumes, ["application/json"]
      key :produces, ["application/json"]

      security_definition :auth do
        key :type, :apiKey
        key :name, "Authorization"
        key :in, :header
      end
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      self,
    ].freeze

    def index
      swagger_data = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      File.open("#{Rails.root}/public/swagger.json", "wb") { |file| file.write(swagger_data.to_json) }
      redirect_to "/api-docs.html?url=/swagger.json"
    end
  end
end
