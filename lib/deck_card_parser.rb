class DeckCardParser
  def parse(deck, card_text)
    if card_text.match(/xmlns:xsd="http:\/\/www.w3.org\/2001\/XMLSchema"/) then
      parse_mtgo(deck, card_text)
    end
  end

  def parse_mtgo(deck, card_text)
    parser = Nokogiri::XML(card_text)

    maindeck_values = Hash.new
    sideboard_values = Hash.new

    parser.xpath("//Cards").each do |card|
      card_name = card["Name"]
      num = card["Quantity"].to_i

      if card["Sideboard"] == "true" then
        sideboard_values[card_name] = (sideboard_values[card_name] || 0) + num
      else
        maindeck_values[card_name] = (maindeck_values[card_name] || 0) + num
      end
    end

    maindeck_values.keys.each do |maindeck_card_name|
      create_maindeck_card_for_deck(deck, maindeck_card_name, maindeck_values[maindeck_card_name])
    end

    sideboard_values.keys.each do |sideboard_card_name|
      create_sideboard_card_for_deck(deck, sideboard_card_name, sideboard_values[sideboard_card_name])
    end
  end

  def create_maindeck_card_for_deck(deck, card_name, num)
    magic_card_name = MagicCardName.find_or_create_by(name: card_name)
    deck_card = MagicDeckCard.create(magic_deck: deck, magic_card_name: magic_card_name)
    deck_card.maindeck = num
    deck_card.save!
  end

  def create_sideboard_card_for_deck(deck, card_name, num)
    magic_card_name = MagicCardName.find_or_create_by(name: card_name)
    deck_card = MagicDeckCard.create(magic_deck: deck, magic_card_name: magic_card_name)
    deck_card.sideboard = num
    deck_card.save!
  end
end

