module Api
  class ShoppingListCategoriesController < ApplicationController
    before_action :set_category, only: [:show]

    def index
      categories = ShoppingListCategory.all.to_a
      render json: categories, status: :ok
    end

    def show
      render json: @category, status: :ok
    end


    private

    def set_category
      @category = ShoppingListCategory.find(params[:id])
    end

  end
end