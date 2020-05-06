module Api
  class ShoppingListItemsController < ApplicationController
    before_action :set_shop_list, only: [:create]
    before_action :set_shop_list_item, only: [:update, :destroy]

    def create
      new_item = @shop_list.items.new(shop_list_items_params)
      if new_item.save
        render json: new_item, status: :ok, serializer: ShoppingListItemSerializer
      else
        render status: :internal_server_error
      end
    end

    def update
      if @shop_list_item.update_attributes(shop_list_items_params)
        render json: @shop_list_item, status: :ok
      else
        render status: :internal_server_error
      end
    end

    def destroy
      @shop_list_item.destroy
      render json: @shop_list_item, status: :ok
    end


    private

    def set_shop_list
      @shop_list = ShoppingList.find(params[:shopping_list_id])
    end

    def set_shop_list_item
      @shop_list_item = ShoppingListItem.find(params[:id])
    end

    def shop_list_items_params
      params.permit(:qty_to_buy, :bought, :store_product_id)
    end

  end
end