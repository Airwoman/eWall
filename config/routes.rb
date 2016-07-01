Rails.application.routes.draw do
  resources :groups
  resources :users
  get '/login' => 'session#new', :as => 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => 'logout'
  patch '/join/:id' => 'groups#join', :as => 'join'
end
