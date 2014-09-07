class DeckCardParser
  def parse(deck, card_text)
    if card_text.match(/xmlns:xsd="http:\/\/www.w3.org\/2001\/XMLSchema"/) then
      parse_mtgo(deck, card_text)
    end
  end

  def parse_mtgo(deck, card_text)
    parser = Nokogiri::XML(card_text)
    parser.xpath("//Cards").each do |card|
      MagicCardName.find_or_create_by(:name => card["Name"])
    end
  end
end

