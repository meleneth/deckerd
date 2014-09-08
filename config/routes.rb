Rails.application.routes.draw do
  resources :magic_projects

  resources :magic_card_types

  resources :magic_decks do
    resources :magic_projects do
      post "add_deck"
    end
  end

  resources :magic_project_decks do
    resources :magic_projects do
      post "remove_deck"
    end
  end

  resources :magic_card_names

  root to: 'visitors#index'
end
