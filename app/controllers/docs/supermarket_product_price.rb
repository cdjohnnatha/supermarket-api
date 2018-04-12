# frozen_string_literal: true

class Docs::SupermarketProductPrice
  include Swagger::Blocks

  swagger_schema :SupermarketProductPrice do
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
         key :'$ref', :SupermarketProductPriceAttributes
      end
    end
  end

  swagger_schema :SupermarketProductPriceInput do
    key :required, [:supermarket_products]

    property :supermarket_products do
      key :type, :array
      items do
        key :required, [:product_id, :price, :quantity, :unit_measure]

        property :product_id do
          key :type, :integer
        end

        property :supermarket_product_prices_attributes do
          key :format, :object
          key :required, [:price]

          property :price do
            key :type, :number
          end
        end
      end
    end
  end

  swagger_schema :SupermarketProductPriceAttributes do
    key :format, :object
    key :required, [:id, :price, :created_at]

    property :id do
      key :type, :integer
    end

    property :price do
      key :type, :number
    end

    property :created_at do
      key :type, :string
      key :format, :date
    end
  end

  swagger_schema :SupermarketProductPriceRangeInput do
    key :required, [:supermarket_product_price]

    property :supermarket_product_price do
      key :format, :object
      key :required, [:started_at, :ended_at]

      property :started_at do
        key :format, :date
        key :type, :string
      end

      property :ended_at do
        key :format, :date
        key :type, :string
      end
    end
  end
end
