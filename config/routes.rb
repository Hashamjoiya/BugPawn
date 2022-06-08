require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/jobmonitor'

  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions',
    passwords: 'api/v1/passwords',
    token_validations: 'api/v1/token_validations'
  }, skip: %i[omniauth_callbacks registrations]

  concern :likeable do
    member do
      get :like
      delete :unlike
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :user, only: %i[show update]
      resources :issues, concerns: :likeable do
        resources :comments, expect: %i[index show], concerns: :likeable
      end

      devise_scope :user do
        resources :users, only: [] do
          controller :registrations do
            post :create, on: :collection
          end
        end
      end
    end
  end
end
