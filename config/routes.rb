Rails.application.routes.draw do
  
  get 'new_billboard_song/:id', to: 'billboards#new_song', as: 'new_billboard_song'
	post 'add_billboard_song/:id/:song_id', to: 'billboards#add_song', as: 'add_billboard_song'
  delete 'remove_billboard_song/:id/:song_id', to: 'billboards#remove_song', as: 'remove_billboard_song'
    
  resources :billboards

  resources :artists do
    resources :songs
  end

  resources :songs do
    resources :comments

  end
  root "artists#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
