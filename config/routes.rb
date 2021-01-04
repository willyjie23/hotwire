Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  resources :rooms do
    member do
      get :room_password, to: 'rooms#password'
    end
    collection do
      post :check_password, to: 'rooms#check_password'
    end
  end
  resources :messages
  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
