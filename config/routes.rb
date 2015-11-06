Rails.application.routes.draw do
  root 'welcome#index'
  resources :doctors do
    get :edit_password, on: :member
  end
  resources :users
  resources :hospitals do
    get :publish, on: :member
  end
end
