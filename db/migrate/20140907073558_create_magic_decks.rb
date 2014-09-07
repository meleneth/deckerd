class CreateMagicDecks < ActiveRecord::Migration
  def change
    create_table :magic_decks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
