module Api
  class StoresController < ApplicationController

    def index
      stores = Store.all.to_a
      render json: stores, status: :ok
    end

  end
end
