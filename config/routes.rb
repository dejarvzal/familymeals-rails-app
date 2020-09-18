Rails.application.routes.draw do
  
  get '/' => 'sessions#welcome'
  resources :ingredients
  resources :recipes
  resources :meals
  resources :users



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
