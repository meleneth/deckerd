class CreateMagicProjectDecks < ActiveRecord::Migration
  def change
    create_table :magic_project_decks do |t|
      t.references :magic_project, index: true
      t.references :magic_deck, index: true

      t.timestamps
    end
  end
end
