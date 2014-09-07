require 'rails_helper'

RSpec.describe MagicDeck, :type => :model do
  context "card parsing" do
    it "Parses the MTGO format" do
      test_content = <<HERE
<?xml version="1.0" encoding="utf-8"?>
<Deck xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NetDeckID>0</NetDeckID>
  <PreconstructedDeckID>0</PreconstructedDeckID>
  <Cards CatID="12527" Quantity="4" Sideboard="false" Name="Cloud of Faeries" />
  <Cards CatID="46587" Quantity="2" Sideboard="true" Name="Dispel" />
</Deck>
HERE
      deck = FactoryGirl.create(:magic_deck)

      expect(MagicCardName).to receive(:find_or_create_by).with(:name => "Cloud of Faeries")
      expect(MagicCardName).to receive(:find_or_create_by).with(:name => "Dispel")

      parser = DeckCardParser.new
      parser.parse(deck, test_content)
    end
  end
end
