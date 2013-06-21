Bolaodaconfe::Application.routes.draw do

  resources :pages


  resources :users
  resources :results
  resources :statistics_results
  resources :matches
  resources :match_progress
  resources :general_ranking
  resources :rules
  resources :history_matches do
    collection do
      get 'preview'
    end
  end
  
  resources :comments
  
  resource :confirmation, :only => [:show] 
  resource :user_sessions, :only => [:create, :new, :destroy]
  
  namespace :admin do
    resources :users
  end
  
  #match 'new/:match' => 'statistics_results#new'
  match 'statistics/:match' => 'results#statistics'
    
  root :to => 'user_sessions#new'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
