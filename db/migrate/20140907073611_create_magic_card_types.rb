class CreateMagicCardTypes < ActiveRecord::Migration
  def change
    create_table :magic_card_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
