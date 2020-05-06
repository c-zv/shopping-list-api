module Api
  class ShoppingListsController < ApplicationController
    before_action :set_shop_list, only: [:show, :update, :destroy, :add_items]

    def index
      shop_lists = ShoppingList.all.to_a
      render json: shop_lists, status: :ok, each_serializer: ShoppingListsEntrySerializer
      # example of response with error:
      # render json: {error: 'Test error message'}, status: :internal_server_error, each_serializer: ShoppingListsEntrySerializer
    end

    def show
      render json: @shop_list, status: :ok
    end

    def create
      shop_list = ShoppingList.new(shopping_list_params)
      shop_list.user = User.first
      if shop_list.save
        render json: shop_list, status: :ok
      else
        render status: :internal_server_error
      end
    end

    def update
      if @shop_list.update_attributes(shopping_list_params)
        render json: @shop_list, status: :ok
      else
        render status: :internal_server_error
      end
    end

    def destroy
      @shop_list.destroy
      render json: @shop_list, status: :ok
    end

    private

    def set_shop_list
      @shop_list = ShoppingList.find(params[:id])
    end

    def shopping_list_params
      params.permit(:name, :description, :shopping_list_category_id)
    end
  end
end