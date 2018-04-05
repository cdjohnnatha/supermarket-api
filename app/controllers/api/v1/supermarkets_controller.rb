# frozen_string_literal: true

module Api::V1
  class SupermarketsController < ApiController
    before_action :set_supermarket, only: [:show, :update, :destroy]

    def index
      @supermarkets = Supermarket.all

      render json: SupermarketSerializer.new(@supermarkets).serialized_json
    end

    def show
      render json: SupermarketSerializer.new(@supermarket).serialized_json
    end

    def create
      @supermarket = Supermarket.new(supermarket_params)

      if @supermarket.save
        render json: SupermarketSerializer.new(@supermarket).serialized_json
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
        params.require(:supermarket).permit(:name, :description)
      end
  end
end
