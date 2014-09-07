class CreateMagicCardNames < ActiveRecord::Migration
  def change
    create_table :magic_card_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
