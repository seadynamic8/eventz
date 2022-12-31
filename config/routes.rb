Rails.application.routes.draw do
  resources :categories
  root "events#index"

  get "events/filter/:filter" => "events#index", as: :filtered_events
  
  # get "events" => "events#index"
  # get "events/new" => "events#new"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"
  resources :events do
    resources :registrations
    resources :likes
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users
  get "signup" => "users#new"
end
