Rails.application.routes.draw do
  root :to => "home#index"
  resources :photos
  resources :stacks
  resources :groups do
    patch '/join' => 'groups#join', on: :member
    get 'photos' => 'groups#photos', on: :member
  end
  resources :users
  get '/wall' => 'wall#index', :as => 'ewall'
  get '/login' => 'session#new', :as => 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => 'logout'

end
