Rails.application.routes.draw do
  resources :admins
  resources :applications
  resources :pets
  resources :shelters
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
