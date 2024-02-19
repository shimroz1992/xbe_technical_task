# This file needs to be checked
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index, :show] do
        get 'air_qualities', on: :member
      end
    end
  end
end
