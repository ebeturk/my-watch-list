Rails.application.routes.draw do
 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'lists#index';

  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create destroy]
    member do
      post 'mark_movie_watched/:movie_id', to: 'lists#mark_movie_watched', as: :mark_movie_watched
    end
  end
  get 'test', to: 'lists#test'
end
