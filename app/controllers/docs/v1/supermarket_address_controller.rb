# frozen_string_literal: true

class Docs::V1::SupermarketAddressController
  include Swagger::Blocks

  swagger_path "/supermarkets/{supermarket_id}/address" do
    operation :get do
      key :sumary, "Get supermarket address"
      key :description, "Returns the supermarket's address"
      key :operationId, "indexSupermarketAddress"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Address"
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
        key :description, "supermarket address response"
      end
    end

    operation :post do
      key :description, "Creates a new supermarket address."
      key :operationId, "createSupermarketAddress"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Address"
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
        key :name, :supermarket_address
        key :description, "Create a supermarket address"
        key :required, true
        schema do
          key :'$ref', :SupermarketAddressInput
        end
      end
      response 200 do
        key :description, "supermarket address response"
        schema do
          key :'$ref', :SupermarketAddress
        end
      end
    end
  end

  swagger_path "/supermarkets/{supermarket_id}/address/{id}" do
    operation :put do
      key :description, "Update a supermarket address"
      key :operationId, "updateSupermarketAddress"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "Supermarket Address"
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
        key :description, "Update a supermarket address"
        key :required, true
        schema do
          key :'$ref', :SupermarketAddressInput
        end
      end

      response 200 do
        key :description, "supermarket address response"
        schema do
          key :'$ref', :SupermarketAddress
        end
      end
    end

    operation :delete do
      key :summary, "Delete a Supermarket address"
      key :description, "Delete Supermarket address"
      key :operationId, "deleteSupermarketAddress"
      key :tags, [
        "Supermarket Address"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of supermarket address"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "supermarket address deleted"
      end
    end
  end
end
