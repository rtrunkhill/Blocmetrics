Rails.application.routes.draw do

  resources :register_app
  
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'users/signout', to: 'devise/sessions#destroy'
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end
