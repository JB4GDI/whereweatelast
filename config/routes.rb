Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # This is our home sweet home
  root 'ledgers#index'

  # Creates all the routes related to ledgers, and has children: places
  resources :ledgers do
    resources :places, only: :create
  end

  resources :places do
    member do
      get 'justatehere'
    end
  end

end
