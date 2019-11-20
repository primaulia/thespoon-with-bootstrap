Rails.application.routes.draw do
  namespace :current_user do
    resources :restaurants, only: [:index]
  end

  resources :restaurants do
    collection do                       # collection => no restaurant id in URL
      get 'all_star'                         # RestaurantsController#top
    end

    member do                             # member => restaurant id in URL
      get 'chef'                          # RestaurantsController#chef
    end 

    resources :comments, only: [:create, :new]  
  end

  resources :comments, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
