Rails.application.routes.draw do

  get 'room_users/create'

  get 'room_users/destroy'

  get 'messages/create'

  root to: 'welcome#index'
  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rooms do
    resources :room_users
    resources :users
  end
  resources :messages
  mount ActionCable.server => '/cable'
end
