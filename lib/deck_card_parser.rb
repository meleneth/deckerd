class DeckCardParser
  def parse(deck, card_text)
    if card_text.match(/xmlns:xsd="http:\/\/www.w3.org\/2001\/XMLSchema"/) then
      parse_mtgo(deck, card_text)
    end
  end

  def parse_mtgo(deck, card_text)
    parser = Nokogiri::XML(card_text)
    parser.xpath("//Cards").each do |card|
      magic_card_name = MagicCardName.find_or_create_by(name: card["Name"])
      deck_card = MagicDeckCard.create(magic_deck: deck, magic_card_name: magic_card_name)
      num = card["Quantity"].to_i

      if card["Sideboard"] == "true" then
        deck_card.sideboard = num
      else
        deck_card.maindeck = num
      end

      deck_card.save!
    end
  end
end

