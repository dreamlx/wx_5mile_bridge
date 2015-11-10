Rails.application.routes.draw do
  root 'welcome#index'
  resources :doctors do
    get :edit_password, on: :member
  end
  resources :users
  resources :hospitals do
    get :publish, on: :member
  end
  resources :news do
    get :publish, on: :member
    get :cancel, on: :member
  end
  resources :advices do
    get :publish, on: :member
    get :cancel, on: :member
  end
  resources :consults

  namespace :api do
    resources :users, only: [:create, :show], defaults: {format: :json} do
      get :doctors, on: :collection, defaults: {format: :json}
    end
    resources :doctors, only: [:index], defaults: {format: :json}
    resources :hospitals do
      get :current, on: :collection, defaults: {format: :json}
    end
    resources :news, only: [:index, :show], defaults: {format: :json}
  end
end
