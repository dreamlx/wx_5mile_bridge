Rails.application.routes.draw do
  root 'welcome#index'
  resources :doctors
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
  resources :appointments
  resources :exams
  resources :shifts
  namespace :api do
    resources :users, only: [:create, :show], defaults: {format: :json} do
      get :doctors, on: :collection, defaults: {format: :json}
    end
    resources :doctors, only: [:index], defaults: {format: :json}
    resources :hospitals do
      get :current, on: :collection, defaults: {format: :json}
    end
    resources :news, only: [:index, :show], defaults: {format: :json}
    resources :advices, only: [:index, :show], defaults: {format: :json}
    resources :doctors, only: [:index, :show], defaults: {format: :json}
    resources :sessions, only: [:create, :destroy], defaults: {format: :json}
    resources :consults, only: [:create, :index], defaults: {format: :json}
    resources :appointments, only: [:create], defaults: {format: :json}
    resources :exams, only: [:create], defaults: {format: :json}
  end
end
