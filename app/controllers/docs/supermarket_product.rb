# frozen_string_literal: true

class Docs::SupermarketProduct
  include Swagger::Blocks

  swagger_schema :SupermarketProduct do
    key :required, [:data]

    property :data do
      key :required, [:id, :type, :attributes]

      property :id do
        key :type, :integer
      end

      property :type do
        key :type, :string
      end

      property :attributes do
        key :type, :object
        key :required, [:id, :price, :quantity, :unit_measure]

        property :id do
          key :type, :integer
        end

        property :price do
          key :type, :number
        end

        property :quantity do
          key :type, :number
        end

        property :unit_measure do
          key :type, :string
        end
      end

      property :relationships do
        key :format, :object

        property :product do
          key :format, :object
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
          end
        end
      end
    end

    property :included do
      key :required, [:id, :type, :attributes]

      property :id do
        key :type, :integer
      end

      property :type do
        key :type, :string
      end

      property :attributes do
        key :'$ref', :Product
      end
    end
  end

  swagger_schema :SupermarketProductInput do
      key :required, [:supermarket_products]

      property :supermarket_products do
          key :type, :array
          items do
            key :required, [:product_id, :price, :quantity, :unit_measure]

            property :product_id do
              key :type, :integer
            end

            property :price do
              key :type, :number
            end

            property :quantity do
              key :type, :number
            end

            property :unit_measure do
              key :type, :string
            end
          end
        end
    end
end
