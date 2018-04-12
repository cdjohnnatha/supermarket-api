# frozen_string_literal: true

module Api::V1
  class SupermarketProductsController < ApiController
    before_action :set_supermarket
    before_action :set_supermarket_product, only: [:destroy, :show, :update]
    before_action :set_options, only: [:index, :show]

    def index
      supermarket_products = @supermarket.supermarket_products

      render json: SupermarketProductSerializer.new(supermarket_products, @options).serialized_json
    end

    def show
      render json: SupermarketProductSerializer.new(@supermarket_product, @options).serialized_json
    end

    def create
      supermarket_product = @supermarket.supermarket_products.create(supermarket_product_params)

      if supermarket_product.valid?
        render json: SupermarketProductSerializer.new(supermarket_product).serialized_json
      else
        render json: supermarket_product.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @supermarket_product.destroy
    end

    def create_and_add
      supermarket_product = SupermarketProduct.create_product_add_to_supermarket(product_params, supermarket_product_params, @supermarket)
      if supermarket_product.valid?
        render json:  SupermarketProductPriceSerializer.new(supermarket_product).serialized_json
      else
        render json: supermarket_product.errors, status: :unprocessable_entity
      end
    end

    private
      def set_supermarket
        @supermarket = Supermarket.find(params[:supermarket_id])
      end

      def supermarket_product_params
        params.require(:supermarket_product).permit(:product_id, supermarket_product_prices_attributes: [:price, :id])
      end

      def set_supermarket_product
        @supermarket_product = @supermarket.supermarket_products.find(params[:id])
      end

      def set_options
        @options = {}
        @options[:include] = [:product]
      end

      def product_params
        params.require(:product).permit(:name, :barcode, :description, :brand, :quantity, :unit_measure)
      end
  end
end
