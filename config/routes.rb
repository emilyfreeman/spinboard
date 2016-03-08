Rails.application.routes.draw do
  root 'links#index'
  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :update]
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: "session#destroy"
  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :update], defaults: { format: :json }
    end
  end

  get '*path', to: 'links#index'
end
