# frozen_string_literal: true

module Api::V1
  class ProductsController < ApiController
    before_action :set_product, only: [:show, :update, :destroy]

    def index
      @products = Product.all

      render json: ProductSerializer.new(@products).serialized_json
    end

    def show
      render json: ProductSerializer.new(@product).serialized_json
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        render json: ProductSerializer.new(@product).serialized_json
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(product_params)
        render json: ProductSerializer.new(@product).serialized_json
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
    end

    private
      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :barcode, :description, :brand, :quantity)
      end
  end
end
