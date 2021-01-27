Rails.application.routes.draw do
  devise_for :users
  resources :events, :only => [:index, :new, :create, :show]
  resources :tickets
  root :to => "application#index"
end
