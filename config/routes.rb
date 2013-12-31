MiniFinance::Application.routes.draw do

  resources :users, only: [:index, :create, :show, :update, :destroy], defaults: {format: :json}
  root 'home#index'
  get "home/index"
  post "login", to: 'authenticated#login'
end
