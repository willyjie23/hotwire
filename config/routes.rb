Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  resources :rooms
  resources :messages
  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
