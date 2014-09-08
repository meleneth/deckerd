class CreateMagicProjects < ActiveRecord::Migration
  def change
    create_table :magic_projects do |t|
      t.string :name

      t.timestamps
    end
  end
end
