Rails.application.routes.draw do
  root "lists#index"

  resources :lists do
    resources :tasks
  end

  post '/status_update', to: 'task#update_status'
end
