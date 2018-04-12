# frozen_string_literal: true

module Api::V1
  class SupermarketProductPricesController < ApiController
    before_action :set_product
    before_action :set_supermarket_product_price, except: [:index, :create, :range]

    def index
      product_prices = @product.supermarket_product_prices.order(created_at: :desc)

      render json:  SupermarketProductPriceSerializer.new(product_prices).serialized_json
    end

    def show
      render json:  SupermarketProductPriceSerializer.new(@supermarketProductPrice).serialized_json
    end

    def create
      product_price = @product.supermarket_product_prices.create(supermarket_product_price_params)

      if product_price.valid?
        render json:  SupermarketProductPriceSerializer.new(product_price).serialized_json
      else
        render json:  product_price.errors, status: :unprocessable_entity
      end
    end

    def update
      if @supermarketProductPrice.update(supermarket_product_price_params)
        render json: SupermarketProductPriceSerializer.new(@supermarketProductPrice).serialized_json
      else
        render json: @supermarketProductPrice.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @supermarketProductPrice.destroy
    end

    def range
      prices = SupermarketProductPrice.range(range_params)

      render json:  SupermarketProductPriceSerializer.new(prices).serialized_json
    end

    private
      def set_product
        @product = SupermarketProduct.find(params[:product_id])
      end

      def set_supermarket_product_price
        @supermarketProductPrice = SupermarketProductPrice.find(params[:id])
      end

      def supermarket_product_price_params
        params.require(:supermarket_product_price).permit(:price)
      end

      def range_params
        ranges = params.require(:supermarket_product_price).permit(:started_at, :ended_at)
      end
  end
end
