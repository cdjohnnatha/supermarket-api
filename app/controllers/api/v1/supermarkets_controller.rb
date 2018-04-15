# frozen_string_literal: true

module Api::V1
  class SupermarketsController < ApiController
    before_action :set_supermarket, only: [:show, :update, :destroy]
    before_action :set_options, only: [:show, :create]

    def index
      @supermarkets = Supermarket.all

      render json: SupermarketSerializer.new(@supermarkets).serialized_json
    end

    def show
      render json: SupermarketSerializer.new(@supermarket, @options).serialized_json
    end

    def create
      @supermarket = Supermarket.new(supermarket_params)

      if @supermarket.save
        render json: SupermarketSerializer.new(@supermarket, @options).serialized_json
      else
        render json: @supermarket.errors, status: :unprocessable_entity
      end
    end

    def update
      if @supermarket.update(supermarket_params)
        render json: SupermarketSerializer.new(@supermarket).serialized_json
      else
        render json: @supermarket.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @supermarket.destroy
    end

    private
      def set_supermarket
        @supermarket = Supermarket.find(params[:id])
      end

      def supermarket_params
        params.require(:supermarket).permit(:name, :description, supermarket_address_attributes: [:lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country, :place_id] )
      end

      def set_options
        @options = {}
        @options[:include] = [:supermarket_address]
      end
  end
end
