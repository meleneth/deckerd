Rails.application.routes.draw do
  resources :magic_projects
  
  post PathHelper::magic_project_add_deck_magic_deck_path(:magic_project_id, :magic_deck_id), to: 'magic_projects#add_deck'
  post PathHelper::magic_project_remove_deck_magic_project_deck_path(:magic_project_id, :magic_project_deck_id), to: 'magic_projects#remove_deck'

  post PathHelper::magic_project_add_card_magic_card_name_path(:magic_project_id, :magic_card_name_id), to: 'magic_projects#add_card'
  post PathHelper::magic_project_remove_card_magic_card_name_path(:magic_project_id, :magic_card_name_id), to: 'magic_projects#remove_card'

  resources :magic_card_types

  resources :magic_decks

  resources :magic_project_decks

  resources :magic_card_names

  root to: 'visitors#index'
end
