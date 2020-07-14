Rails.application.routes.draw do
  namespace 'api' do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :shopping_lists do 
      resources :items, only: [:create, :update, :destroy], controller: 'shopping_list_items'
    end
    resources :categories, only: [:index, :show], controller: 'shopping_list_categories'
  end
end
