Rails.application.routes.draw do
  namespace :admin do
    resources :services
    resources :service_categories do
      collection do
        post :rebuild
      end
    end

    resources :vendors

    resource :file_uploads, only: [:create]

    # resource :file_upload do
    #   get :upload_files
    #   post :upload_files
    #   delete :destroy_file
    #   put :update_position
    #   patch :update_file
    # end

    root to: 'services#index'
  end
end
