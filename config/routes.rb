Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "/admin_login", to: 'sessions#admin_new'
  post "/admin_login", to: 'sessions#admin_create'
  #post '/signout'. to: 'sessions#signout'
  get '/auth/github/callback' => 'sessions#omniauth'

  get '/pets/dogs' => 'pets#dogs'
  get '/pets/cats' => 'pets#cats'

  resources :admins
  resources :applications
  resources :pets
  resources :shelters do
    resources :pets
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
