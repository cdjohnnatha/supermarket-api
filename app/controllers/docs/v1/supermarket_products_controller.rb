# frozen_string_literal: true

class Docs::V1::SupermarketProductsController
  include Swagger::Blocks

  swagger_path "/supermarkets/{supermarket_id}/products" do
    operation :get do
      key :sumary, "Get all products"
      key :description, "Returns all products from a supermarket"
      key :operationId, "indexSupermarketProducts"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Products"
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
      response 200 do
        key :description, "supermarket products response"
      end
    end

    operation :post do
      key :description, "Creates a new product at store."
      key :operationId, "addSupermarketProducts"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Products"
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
        key :in, :body
        key :name, :product
        key :description, "Add product to supermarket"
        key :required, true
        schema do
          key :'$ref', :SupermarketProductInput
        end
      end
      response 200 do
        key :description, "product response"
        schema do
          key :'$ref', :SupermarketProduct
        end
      end
    end
  end

  swagger_path "/supermarkets/{supermarket_id}/products/{id}" do
    operation :get do
      key :description, "Returns a single product"
      key :operationId, "findSupermarketProductById"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Products"
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
       key :name, :id
       key :description, "Id of product"
       key :required, true
       key :type, :integer
     end
      response 200 do
        key :description, "product response"
        schema do
          key :'$ref', :SupermarketProduct
        end
      end
    end

    operation :put do
      key :description, "Update product informations from supermarket"
      key :operationId, "updateSupermarketProduct"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Products"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of supermarket"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :supermarket
        key :description, "Update supermarket at store"
        key :required, true
        schema do
          key :'$ref', :SupermarketProductInput
        end
      end

      response 200 do
        key :description, "supermarket response"
        schema do
          key :'$ref', :SupermarketProduct
        end
      end
    end

    operation :delete do
      key :summary, "Delete an Product"
      key :description, "Delete an Product"
      key :operationId, "deleteProduct"
      key :tags, [
        "Supermarket Products"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of Product"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "product deleted"
      end
    end
  end

  swagger_path "/supermarkets/{supermarket_id}/products/create-add" do
    operation :post do
      key :description, "Creates a new product and add to a supermarket."
      key :operationId, "createProductAddSupermarketProducts"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Products"
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
        key :in, :body
        key :name, :product
        key :description, "Create product and add to supermarket"
        key :required, true
        schema do
          key :'$ref', :ProductSupermarketProductInput
        end
      end
      response 200 do
        key :description, "supermarket product response"
      end
    end
  end
end
