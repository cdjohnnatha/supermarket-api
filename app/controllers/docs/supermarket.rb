# frozen_string_literal: true

class Docs::Supermarket
  include Swagger::Blocks

  swagger_schema :Supermarket do
    allOf do
      schema do
        key :'$ref', :SimpleCore
      end
      schema do
        property :data do
          property :attributes do
            key :required, [:id]
            
            property :id do
              key :type, :integer
            end
          end
        end
      end
      schema do
        property :data do
          property :attributes do
            key :'$ref', :SupermarketAttributes
          end
        end
      end
    end
  end

  swagger_schema :SupermarketInput do
    key :required, [:supermarket]

    property :supermarket do
      key :format, :object
      key :'$ref', :SupermarketAttributes

      property :supermarket_address_attributes do
        key :format, :object
        key :'$ref', :SupermarketAddressAttributes
      end
    end
  end

   swagger_schema :SupermarketAttributes do
      key :required, [:name, :description]

      property :name do
        key :type, :string
      end

      property :description do
        key :type, :string
      end
   end
end
