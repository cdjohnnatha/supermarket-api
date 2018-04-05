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
      supermarket_product = @supermarket.supermarket_products.build(product_array_params)

      if supermarket_product.each(&:save)
        render json: SupermarketProductSerializer.new(supermarket_product).serialized_json
      else
        render json: supermarket_product.errors, status: :unprocessable_entity
      end
    end

    def update
      if @supermarket_product.update(product_params)
        render json: SupermarketProductSerializer.new(@supermarket_product).serialized_json
      else
        render json: @supermarket_product.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @supermarket_product.destroy
    end

    private
      def set_supermarket
        @supermarket = Supermarket.find(params[:supermarket_id])
      end

      def product_array_params
        params.require(:supermarket_products).map { |p| p.permit(:product_id, :price, :quantity) }
      end

      def product_params
        params.require(:supermarket_products).permit(:price, :quantity)
      end

      def set_supermarket_product
        @supermarket_product = @supermarket.supermarket_products.find(params[:id])
      end

      def set_options
        @options = {}
        @options[:include] = [:product]
      end
  end
end
