Rails.application.routes.draw do
  root "lists#index"

  resources :lists do
    resources :tasks
  end

  post "/change", to: "tasks#change_status"
end
