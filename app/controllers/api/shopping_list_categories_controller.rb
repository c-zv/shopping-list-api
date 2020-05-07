module Api
  class ShoppingListCategoriesController < ApplicationController
    def index
      categories = ShoppingListCategory.all.to_a
      render json: categories, status: :ok
    end
  end
end