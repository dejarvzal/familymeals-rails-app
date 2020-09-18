Rails.application.routes.draw do
  
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  resources :ingredients
  resources :recipes
  resources :meals
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
