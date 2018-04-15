# frozen_string_literal: true

class Docs::SupermarketAddress
  include Swagger::Blocks

  swagger_schema :SupermarketAddress do
    allOf do
      schema do
        key :'$ref', :SimpleCore
      end
      schema do
        property :data do
          property :attributes do
            key :format, :object
            key :required, [:id, :lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country]
            
            property :id do
              key :type, :integer
            end
          end
        end
      end
      schema do
        property :data do
          property :attributes do
            key :'$ref', :SupermarketAddressAttributes
          end
        end
      end
    end
  end

  swagger_schema :SupermarketAddressInput do
    key :required, [:product]

    property :supermarket_address do
      key :format, :object
      key :'$ref', :SupermarketAddressAttributes
    end
  end

  swagger_schema :SupermarketAddressAttributes do
    key :required, [:lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country]

    property :lat do
        key :type, :number
      end

    property :lng do
      key :type, :number
    end

    property :street_number do
      key :type, :string
    end

    property :street_name do
      key :type, :string
    end

    property :neighborhood do
      key :type, :string
    end

    property :city do
      key :type, :string
    end

    property :state do
      key :type, :string
    end

    property :zip do
      key :type, :string
    end

    property :country do
      key :type, :string
    end

    property :place_id do
      key :type, :string
    end
  end
end

