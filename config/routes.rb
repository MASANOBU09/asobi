Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'vacations/top' => 'vacations#top'
  resources :vacations
  get 'sindans/index' => 'sindans#index'
  root 'vacations#top'
  post '/sindans/index', to: 'sindans#index'
  patch 'vacations/:id' => 'vacations#update'
  delete 'vacations/:id' => 'vacations#destroy' 
end
