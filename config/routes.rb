Rails.application.routes.draw do
  namespace :admin do
    resources :time_ranges
  end

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login', sign_out: 'logout',
    registration: 'register',
    password: 'secret',
    edit: 'edit/profile'
  },
    controllers: {
      sessions: 'auth/sessions',
      registrations: 'auth/registrations',
      confirmations: 'auth/confirmations'
  }

  resources :vendors
  resources :service_categories
  resources :services, only: [:index, :show]
  resources :tickets, only: [:show, :create, :update]
  resources :users, only: [:show]
  resources :vendors, only: [:show] do
    resources :tickets, only: :index
  end

  resource :cabinet, controller: :cabinet, only: [:show, :edit, :update] do
    get :tickets
  end

  resources :images, only: [:create]

  get '/test', to: 'application#test'

  root to: 'application#home'
end
