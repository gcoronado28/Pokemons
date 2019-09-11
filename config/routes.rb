Rails.application.routes.draw do
  root 'pokemons#index'
  get 'index', to: 'pokemons#index'
  post 'upload', to: 'pokemons#upload'
  delete 'destroy_all', to: 'pokemons#destroy_all'
end
