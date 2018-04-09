# frozen_string_literal: true

module Api::V1
  class SupermarketAddressController < ApiController
    before_action :set_supermarket
    before_action :set_address, except: [:show, :create]

    def index
      render json: SupermarketAddressSerializer.new(@address).serialized_json
    end

    def create
      address = @supermarket.create_supermarket_address(supermarket_address_params)

      if address.valid?
        render json: SupermarketAddressSerializer.new(address).serialized_json
      else
        render json: address.errors, status: :unprocessable_entity
      end
    end

    def update
      if @address.update(supermarket_address_params)
        render json: SupermarketAddressSerializer.new(@address).serialized_json
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @address.destroy
    end

    private
      def set_supermarket
        @supermarket = Supermarket.find(params[:supermarket_id])
      end

      def set_address
        @address = @supermarket.supermarket_address
      end

      def supermarket_address_params
        params.require(:supermarket_address).permit(:lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country, :place_id)
      end
  end
end
