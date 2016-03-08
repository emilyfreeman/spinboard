Rails.application.routes.draw do
  resources :users, only: [:new, :create, :update]
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/logout', to: "session#destroy"
end
