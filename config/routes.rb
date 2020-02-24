Rails.application.routes.draw do
  
  resources :billboards

  resources :artists do
    resources :songs
  end

  resources :songs do
    resources :comments

  end
  root "billboards#index"
  get '/billboards/:id/add_songs', to: 'billboards#add_songs'

  get 'new_theater_movie
  /:id', to: 'theaters#new_movie', as: 'new_theater_movie'
	post 'add_theater_movie/:id/:movie_id', to: 'theaters#add_movie', as: 'add_theater_movie'
  delete 'remove_theater_movie/:id/:movie_id', to: 'theaters#remove_movie', as: 'remove_theater_movie'
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
