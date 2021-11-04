Rails.application.routes.draw do
  resources :like
  post 'like/create'
  post 'like/destroy'
  resources :user
  get 'session/new'
  post 'session/create'
  get 'session/destroy'
  get 'comment/new'
  resources :session, only:[:new, :create, :destroy]
  resources :gossip
  resources :profile
  resources :welcome
  resources :city
  resources :comment
  # get 'profile/:user_id', to: 'profile#show'
  # get 'welcome/:user_entry', to: 'welcome#bonjour_name'
  # get 'gossip/:user_entry', to: 'gossip#show'
  get 'contact', to: 'static#contact'
  get 'team', to: 'static#team'
  get '/', to:'static#index'
  # à chaque création de route,  "$ rails g controller welcome bonjour_name"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
