class CreateMagicDeckCards < ActiveRecord::Migration
  def change
    create_table :magic_deck_cards do |t|
      t.references :magic_deck, index: true
      t.references :magic_card_name, index: true
      t.integer :maindeck
      t.integer :sideboard

      t.timestamps
    end
  end
end
