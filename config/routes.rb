Rails.application.routes.draw do



resources :products
resources :products do
    resources :reviews, only: [:show, :create, :destroy]
end
resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create, :destroy]


  # get '/user/login'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
