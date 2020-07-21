module Api
  class StoreProductsController < ApplicationController
    before_action :set_store_product, only: [:show]

    def index
      store_products = StoreProduct.all.to_a
      render json: store_products, status: :ok, each_serializer: StoreProductSerializer
    end

    def show
      render json: @store_product, status: :ok
    end

    private

    def set_store_product
      @store_product = StoreProduct.find(params[:id])
    end
  end
end