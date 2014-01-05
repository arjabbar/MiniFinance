MiniFinance::Application.routes.draw do
  
  resources :users, :billers, :finances, only: [:index, :create, :show, :update, :destroy], defaults: {format: :json}
  get 'email_available', to: 'users#check_if_email_available'
  root 'home#index'
  post "login", to: 'authenticated#login'
  post "register", to: 'users#create'

end
