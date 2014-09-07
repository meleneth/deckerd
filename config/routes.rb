Rails.application.routes.draw do
  resources :magic_card_types

  resources :magic_decks

  resources :magic_card_names

  root to: 'visitors#index'
end
