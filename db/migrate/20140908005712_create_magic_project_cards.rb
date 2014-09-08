class CreateMagicProjectCards < ActiveRecord::Migration
  def change
    create_table :magic_project_cards do |t|
      t.references :magic_card_name, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
