class CardCollection
  def initialize
    @cards = []
  end

  def card_for_name(name)
    @cards.each do |card|
      return card if card.name == name
    end

    card = OpenStruct.new :name => name, :magic_card_name_id => nil, :qty => 0
    @cards << card
    card
  end

  def add_card(magic_card)
    card = card_for_name(magic_card.magic_card_name.name)
    card.magic_card_name_id = magic_card.magic_card_name_id
    card.qty = card.qty + (magic_card.maindeck || 0) + (magic_card.sideboard || 0)
  end

  def remove_card_qty(card_name, qty)
    card = card_for_name(card_name)
    card.qty = card.qty - qty
    @cards.delete(card) if card.qty == 0
  end

  def card_names
    card_names = Array.new
    @cards.each do |card|
      card_names << card.name
    end
    card_names.sort
  end
  
  def qty(card_name)
    card = card_for_name(card_name)
    card.qty
  end

  def magic_card_name_id(card_name)
    card = card_for_name(card_name)
    card.magic_card_name_id
  end
end
