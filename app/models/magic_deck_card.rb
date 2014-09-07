class MagicDeckCard < ActiveRecord::Base
  belongs_to :magic_deck
  belongs_to :magic_card_name
end
