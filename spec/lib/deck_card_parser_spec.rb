require 'rails_helper'

RSpec.describe DeckCardParser do
  context "card parsing" do
    it "Parses the MTGO format" do
      test_content = <<HERE
<?xml version="1.0" encoding="utf-8"?>
<Deck xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NetDeckID>0</NetDeckID>
  <PreconstructedDeckID>0</PreconstructedDeckID>
  <Cards CatID="12527" Quantity="1" Sideboard="false" Name="Cloud of Faeries" />
  <Cards CatID="12527" Quantity="3" Sideboard="false" Name="Cloud of Faeries" />
  <Cards CatID="46587" Quantity="2" Sideboard="true" Name="Dispel" />
</Deck>
HERE
      deck = FactoryGirl.create(:magic_deck)

      parser = DeckCardParser.new
      parser.parse(deck, test_content)

      cards = deck.magic_deck_cards
      expect(cards[0].magic_card_name.name).to eq("Cloud of Faeries")
      expect(cards[0].sideboard).to be_nil
      expect(cards[0].maindeck).to eq(4)
      expect(cards[1].magic_card_name.name).to eq("Dispel")
      expect(cards[1].sideboard).to eq(2)
      expect(cards[1].maindeck).to be_nil
    end
  end
end
