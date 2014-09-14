require 'rails_helper'


describe "PathHelper" do
  describe "#path_route_helper_url" do
    it "Works correctly for basic case" do
      f = PathHelper.path_route_helper_url(MagicProject, :add_deck, MagicDeck)
      expect(f).to eq("/magic_projects/:magic_project_id/add_deck/magic_decks/:magic_deck_id")
    end
  end
  describe "#path_route_helper_function_name" do
    it "Works correctly for basic case" do
      f = PathHelper.path_route_helper_function_name(MagicProject, :add_deck, MagicDeck)
      expect(f).to eq("magic_project_add_deck_magic_deck_path(magic_project, magic_deck)")
    end
  end
  describe "#magic_project_add_deck_magic_deck_path" do
    it "Works correctly for route case" do
      f = PathHelper::magic_project_add_deck_magic_deck_path(:magic_project_id, :magic_deck_id)
      expect(f).to eq("/magic_projects/:magic_project_id/add_deck/magic_decks/:magic_deck_id")
    end
    it "Works correctly for basic case" do
      project = FactoryGirl.create :magic_project
      deck = FactoryGirl.create :magic_deck

      f = PathHelper::magic_project_add_deck_magic_deck_path(project, deck)
      expect(f).to eq("/magic_projects/#{project.id}/add_deck/magic_decks/#{deck.id}")
    end
  end
end
