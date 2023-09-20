Rails.application.routes.draw do
 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'lists#index';

  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create destroy]
  end
  # get 'lists', to: 'lists#index'
  # get 'lists/:id', to: 'lists#new'
  # post 'lists', to: 'lists#create'
  # get 'lists/new', to: 'lists#show'
  get 'test', to: 'lists#test'
end
