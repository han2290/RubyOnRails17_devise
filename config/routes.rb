Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  
  resources :movies do
    member do
      post '/comments' => 'movies#create_comment'
    end
    collection do
      delete '/comments/:comment_id'  =>  'movies#destroy_comment'
      patch '/comments/:comment_id'   =>  'movies#update_comment'
      get '/search_movie'             =>  'movies#search_movie'
    end
  end
  
  get '/likes/:movie_id' => 'movies#like_movie'
  
end
