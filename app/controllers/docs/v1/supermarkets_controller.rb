# frozen_string_literal: true

class Docs::V1::SupermarketsController
  include Swagger::Blocks

  swagger_path "/supermarkets" do
    operation :get do
      key :sumary, "Get all supermarkets"
      key :description, "Returns all supermarkets"
      key :operationId, "indexSupermarkets"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarkets"
      ]
      security do
        key :auth, []
      end
      response 200 do
        key :description, "supermarkets response"
      end
    end

    operation :post do
      key :description, "Creates a new supermarket at store. Email is unique"
      key :operationId, "addSupermarket"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarkets"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :body
        key :name, :supermarket
        key :description, "Add supermarket to store"
        key :required, true
        schema do
          key :'$ref', :SupermarketInput
        end
      end
      response 200 do
        key :description, "supermarket response"
        schema do
          key :'$ref', :Supermarket
        end
      end
    end
  end

  swagger_path "/supermarkets/{id}" do
    operation :get do
      key :description, "Returns a single supermarket"
      key :operationId, "findSupermarketById"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarkets"
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
      response 200 do
        key :description, "supermarket response"
        schema do
          key :'$ref', :Supermarket
        end
      end
    end

    operation :put do
      key :description, "Update supermarket informations"
      key :operationId, "updateSupermarket"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarkets"
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
          key :'$ref', :SupermarketInput
        end
      end

      response 200 do
        key :description, "supermarket response"
        schema do
          key :'$ref', :Supermarket
        end
      end
    end

    operation :delete do
      key :summary, "Delete an Supermarket"
      key :description, "Delete an Supermarket"
      key :operationId, "deleteSupermarket"
      key :tags, [
        "Supermarkets"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of Supermarket"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "supermarket deleted"
      end
    end
  end
end