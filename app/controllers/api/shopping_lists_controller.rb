module Api
  class ShoppingListsController < ApplicationController
    before_action :set_shop_list, only: [:show, :update, :add_item, :destroy]

    def index
      shop_lists = ShoppingList.all.to_a
      render json: shop_lists, status: :ok, each_serializer: ShoppingListsIndexSerializer
      # example of response with error:
      # render json: {error: 'Test error message'}, status: :internal_server_error, each_serializer: ShoppingListsEntrySerializer
    end

    def show
      render json: @shop_list, status: :ok
    end

    def create
      if ShoppingList.count > 20
        msg = 'Due to storage restrictions, maximum number of shopping lists is limited to 20'
        render json: {error: msg}, status: :internal_server_error
      else
        shop_list = ShoppingList.new(shopping_list_params)
        shop_list.user = User.first
        if shop_list.save
          render json: shop_list, status: :ok
        else
          render status: :internal_server_error
        end
      end
    end

    def update
      if @shop_list.update_attributes(shopping_list_params)
        render json: @shop_list, status: :ok
      else
        render status: :internal_server_error
      end
    end

    def add_item
      id = add_item_params[:store_product_id]
      qty = add_item_params[:qty_to_buy]
      store_product = StoreProduct.find(id)
      new_item = @shop_list.items.new(store_product: store_product, qty_to_buy: qty)
      if new_item.save!
        render status: :ok
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
      params.permit(:name, :description, :category_id, :shopping_list_category_id)
    end

    def add_item_params
      params.permit(:store_product_id, :qty_to_buy)
    end
  end
end