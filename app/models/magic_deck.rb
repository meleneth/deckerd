class MagicDeck < ActiveRecord::Base
  has_many :magic_deck_cards

  def maindeck_cards
    magic_deck_cards.select(&:maindeck)
  end

  def sideboard_cards
    magic_deck_cards.select(&:sideboard)
  end
end
