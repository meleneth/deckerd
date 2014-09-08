class MagicProjectDeck < ActiveRecord::Base
  belongs_to :magic_project
  belongs_to :magic_deck
end
