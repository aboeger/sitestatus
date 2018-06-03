Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  resources :companies do
    collection { get :import }
    collection { post :process_import_file }
    collection { get :find_duplicates }
  end
end
