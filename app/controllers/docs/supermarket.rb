# frozen_string_literal: true

class Docs::Supermarket
  include Swagger::Blocks

  swagger_schema :Supermarket do
    key :format, :object
    key :required, [:data]

    property :data do
      key :format, :object
      key :required, [:attributes, :type, :id]

      property :id do
        key :type, :integer
      end

      property :type do
        key :type, :string
      end

      property :attributes do
        key :required, [:id, :name, :description]

        property :id do
          key :type, :integer
        end

        property :name do
          key :type, :string
        end

        property :description do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :SupermarketInput do
    key :required, [:supermarket]

    property :supermarket do
      key :format, :object
      key :required, [:name, :description]

      property :name do
        key :type, :string
      end

      property :description do
        key :type, :string
      end
    end
  end
end
