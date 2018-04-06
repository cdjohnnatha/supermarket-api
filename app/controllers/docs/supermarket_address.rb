# frozen_string_literal: true

class Docs::SupermarketAddress
  include Swagger::Blocks

  swagger_schema :SupermarketAddress do
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
        key :required, [:id, :lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country]
        property :id do
          key :type, :integer
        end

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
  end

  swagger_schema :SupermarketAddressInput do
    key :required, [:product]

    property :supermarket_address do
      key :format, :object
      key :required, [:id, :lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country]

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
end
