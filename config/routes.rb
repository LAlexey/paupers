Rails.application.routes.draw do
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

  root to: 'application#home'

  resources :services, only: [:index, :show]
  resources :tickets, only: [:show, :create, :update]

  resource :cabinet, controller: :cabinet, only: [] do
    get :tickets
  end

  resources :vendors, only: [:show] do
    resources :tickets, only: :index
  end
end
