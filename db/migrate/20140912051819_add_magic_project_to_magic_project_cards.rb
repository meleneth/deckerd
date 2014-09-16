class AddMagicProjectToMagicProjectCards < ActiveRecord::Migration
  def change
    add_reference :magic_project_cards, :magic_project, index: true
  end
end
