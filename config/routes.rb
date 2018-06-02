Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  resources :companies do
    collection { post :import }
  end
end
