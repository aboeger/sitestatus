Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  resources :companies do
    collection { post :import }
    collection { get :find_duplicates }
  end
end
