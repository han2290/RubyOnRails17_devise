Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  
  resources :movies
  
  get '/likes/:movie_id' => 'movies#like_movie'
  
end
