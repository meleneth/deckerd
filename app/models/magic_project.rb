class MagicProject < ActiveRecord::Base
  has_many :magic_project_decks
  has_many :magic_project_cards
end
