class CreateMagicCardTypeMaps < ActiveRecord::Migration
  def change
    create_table :magic_card_type_maps do |t|
      t.references :magic_card_name, index: true
      t.references :magic_card_type, index: true

      t.timestamps
    end
  end
end
