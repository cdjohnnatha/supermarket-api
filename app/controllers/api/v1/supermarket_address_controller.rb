# frozen_string_literal: true

module Api::V1
  class SupermarketAddressController < ApplicationController
    before_action :set_supermarket
    before_action :set_address, except: [:show, :create]

    def index
      render json: SupermarketAddressSerializer.new(@address).serialized_json
    end

    def create
      @address = @supermarket.create_supermarket_address(address_params)

      if @address.valid?
        render json: SupermarketAddressSerializer.new(@address).serialized_json
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end

    def update
      if @address.update(address_params)
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

      def address_params
        params.require(:supermarket_address).permit(:lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country)
      end
  end
end
