# frozen_string_literal: true

class Docs::Core
  include Swagger::Blocks

  swagger_schema :SimpleCore do
    key :required, [:data]

    property :data do
      key :format, :object
      key :required, [:id, :type]

      property :id do
        key :type, :integer
      end

      property :type do
        key :type, :string
      end

      property :attributes do
      end
    end
  end
end