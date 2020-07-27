Rails.application.routes.draw do
  namespace 'api' do
    resources :store_products, only: [:index, :show]
    resources :shopping_lists do 
      resources :items, only: [:create, :update, :destroy], controller: 'shopping_list_items'
      member do
        put 'add_item'
      end
    end
    resources :categories, only: [:index, :show], controller: 'shopping_list_categories'
  end
end
