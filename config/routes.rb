Rails.application.routes.draw do
  # get 'events' => 'events#index'
  # get 'events/new'
  # get 'events/create'
  # get 'events/:id' => 'events#show'
  # post 'events/new' => 'events#create'
  resources :events, :only => [:index, :new, :create, :show]
  resources :tickets
  root :to => "tickets#index"
end
