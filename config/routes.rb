Rails.application.routes.draw do

  resources :register_app

  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'users/signout', to: 'devise/sessions#destroy'
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end
