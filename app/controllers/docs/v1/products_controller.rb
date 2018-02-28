# frozen_string_literal: true

class Docs::V1::ProductsController
  include Swagger::Blocks

  swagger_path "/products" do
    operation :get do
      key :sumary, "Get all products"
      key :description, "Returns all products"
      key :operationId, "indexProducts"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Products"
      ]
      security do
        key :auth, []
      end
      response 200 do
        key :description, "products response"
      end
    end

    operation :post do
      key :description, "Creates a new product at store. Email is unique"
      key :operationId, "addProduct"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Products"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :body
        key :name, :product
        key :description, "Add product to store"
        key :required, true
        schema do
          key :'$ref', :ProductInput
        end
      end
      response 200 do
        key :description, "product response"
        schema do
          key :'$ref', :Product
        end
      end
    end
  end

  swagger_path "/products/{id}" do
    operation :get do
      key :description, "Returns a single product"
      key :operationId, "findSupermarketById"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Products"
      ]
      security do
        key :auth, []
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
          key :'$ref', :Product
        end
      end
    end

    operation :put do
      key :description, "Update product informations"
      key :operationId, "updateProduct"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Products"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of product"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :product
        key :description, "Update product at store"
        key :required, true
        schema do
          key :'$ref', :ProductInput
        end
      end

      response 200 do
        key :description, "product response"
        schema do
          key :'$ref', :Product
        end
      end
    end

    operation :delete do
      key :summary, "Delete an Product"
      key :description, "Delete an Product"
      key :operationId, "deleteProduct"
      key :tags, [
        "Products"
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
end