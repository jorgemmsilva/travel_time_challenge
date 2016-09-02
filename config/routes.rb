Rails.application.routes.draw do
  resources :negotiators
  resources :routes
  resources :points
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  get "/getproperties", to: "points#getProperties"
end
