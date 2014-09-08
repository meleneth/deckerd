class CardCollection
  def initialize
    @card_qty_by_name = Hash.new
    @magic_card_name_id_by_name = Hash.new
  end

  def add_card(card)
    card_name = card.magic_card_name.name
    @magic_card_name_id_by_name[card_name] = card.magic_card_name_id
    @card_qty_by_name[card_name] = (@card_qty_by_name[card_name] || 0) + (card.maindeck || 0) + (card.sideboard || 0)
  end

  def remove_card_qty(card_name, qty)
    @card_qty_by_name[card_name]  = @card_qty_by_name - qty
    @card_qty_by_name.delete card_name if @card_qty_by_name[card_name] == 0
  end

  def card_names
    @card_qty_by_name.keys.sort
  end
  
  def qty(card_name)
    @card_qty_by_name[card_name]
  end

  def magic_card_name_id(card_name)
    @magic_card_name_id_by_name[card_name]
  end
end
