# frozen_string_literal: true

class Docs::Product
  include Swagger::Blocks

  swagger_schema :Product do
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
        key :format, :object
        key :required, [:id, :name, :description, :barcode, :brand, :quantity]
        property :id do
          key :type, :integer
        end

        property :name do
          key :type, :string
        end

        property :description do
          key :type, :string
        end

        property :barcode do
          key :type, :string
        end

        property :brand do
          key :type, :string
        end

        property :quantity do
          key :type, :integer
        end
      end
    end
  end

  swagger_schema :ProductInput do
    key :required, [:product]

    property :product do
      key :format, :object
      key :required, [:name, :description, :barcode, :brand, :quantity]

      property :name do
        key :type, :string
      end

      property :description do
        key :type, :string
      end

      property :barcode do
        key :type, :string
      end

      property :brand do
        key :type, :string
      end

      property :quantity do
        key :type, :integer
      end
    end
  end
end
