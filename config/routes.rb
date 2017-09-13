Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # This is our home sweet home
  root 'ledgers#index'

  # Creates all the routes related to ledgers
  resources :ledgers
end
