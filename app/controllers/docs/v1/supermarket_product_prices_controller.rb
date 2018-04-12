# frozen_string_literal: true

class Docs::V1::SupermarketProductPricesController
  include Swagger::Blocks

  swagger_path "/supermarkets/{supermarket_id}/products/{product_id}/prices" do
    operation :get do
      key :sumary, "Get all prices from a product in supermarket"
      key :description, "Returns all products from a supermarket"
      key :operationId, "indexSupermarketProductsPrices"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Product Prices"
      ]
      security do
        key :auth, []
      end
      parameter do
        key :in, :path
        key :name, :supermarket_id
        key :description, "Id of supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :product_id
        key :description, "Id of product"
        key :required, true
        key :type, :integer
      end

      response 200 do
        key :description, "supermarket product prices response"
      end
    end

    operation :post do
      key :description, "Creates a new price in a product at supermarket."
      key :operationId, "addSupermarketProductPrices"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Product Prices"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :supermarket_id
        key :description, "Id of supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :product_id
        key :description, "Id of product at supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :supermarket_product_price
        key :description, "Add price to a product in a supermarket"
        key :required, true
        schema do
          key :'$ref', :SupermarketProductPriceInput
        end
      end
      response 200 do
        key :description, "supermarket product price response"
        schema do
          key :'$ref', :SupermarketProductPrice
        end
      end
    end
  end

  swagger_path "/supermarkets/{supermarket_id}/products/{product_id}/prices/{id}" do
    operation :get do
      key :description, "Returns a single supermarket product price"
      key :operationId, "findSupermarketProductPriceById"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Product Prices"
      ]
      security do
        key :auth, []
      end
      parameter do
        key :in, :path
        key :name, :supermarket_id
        key :description, "Id of supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :product_id
        key :description, "Id of product at supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of a supermarket product price"
        key :required, true
        key :type, :integer
      end

      response 200 do
        key :description, "product response"
        schema do
          key :'$ref', :SupermarketProductPrice
        end
      end
    end

    operation :put do
      key :description, "Update product informations from supermarket"
      key :operationId, "updateSupermarketProductPrice"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Product Prices"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :supermarket_id
        key :description, "Id of supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :product_id
        key :description, "Id of product at supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of a supermarket product price"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :supermarket
        key :description, "Update supermarket at store"
        key :required, true
        schema do
          key :'$ref', :SupermarketProductPriceInput
        end
      end

      response 200 do
        key :description, "supermarket product priceresponse"
        schema do
          key :'$ref', :SupermarketProductPrice
        end
      end
    end

    operation :delete do
      key :summary, "Delete a supermarket product price"
      key :description, "Delete a supermarket product price"
      key :operationId, "deleteSupermarketProductPrice"
      key :tags, [
        "Supermarket Product Prices"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of Supermarket Product Price"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "supermarket product price deleted"
      end
    end
  end

  swagger_path "/supermarkets/{supermarket_id}/products/{product_id}/prices/date-range" do
    operation :post do
      key :description, "Find prices by range in a product at supermarket."
      key :produces, [
        "application/json"
      ]
      key :operationId, "findSupermarketProductPricesByRange"
      key :tags, [
        "Supermarket Product Prices"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :supermarket_id
        key :description, "Id of supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :product_id
        key :description, "Id of product at supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :supermarket_product_price
        key :description, "Add price to a product in a supermarket"
        key :required, true
        schema do
          key :'$ref', :SupermarketProductPriceRangeInput
        end
      end
      response 200 do
        key :description, "supermarket product price response"
        schema do
          key :'$ref', :SupermarketProductPrice
        end
      end
    end
  end
end
