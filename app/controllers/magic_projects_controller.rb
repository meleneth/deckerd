class MagicProjectsController < ApplicationController
  before_action :set_magic_project, only: [:update, :destroy]

  # GET /magic_projects
  # GET /magic_projects.json
  def index
    @magic_projects = MagicProject.all
  end

  # GET /magic_projects/1
  # GET /magic_projects/1.json
  def show
    @magic_project = MagicProject.includes(magic_project_decks: [magic_deck: [magic_deck_cards: [:magic_card_name]]], magic_project_cards: [:magic_card_name]).find(params[:id])
    @project_decks = @magic_project.magic_project_decks
    @all_decks = MagicDeck.all
    @needs = CardCollection.new
    @haves = @magic_project.magic_project_cards

    @project_decks.each do |deck|
      deck.magic_deck.magic_deck_cards.each do |magic_card|
        @needs.add_card(magic_card)
      end
    end

    h = []
    @haves.each do |card|
      @needs.remove_card_qty(card.magic_card_name.name, card.quantity)
      h << card
    end

    @haves = h.sort {|a, b| a.magic_card_name.name <=> b.magic_card_name.name }
  end

  # GET /magic_projects/new
  def new
    @magic_project = MagicProject.new
  end

  def add_deck
    @magic_deck = MagicDeck.find(params[:magic_deck_id])
    @magic_project = MagicProject.find(params[:magic_project_id])
    MagicProjectDeck.create(:magic_deck => @magic_deck, :magic_project => @magic_project)
    redirect_to :back
  end

  def remove_deck
    @magic_project_deck = MagicProjectDeck.find(params[:magic_project_deck_id])
    @magic_project_deck.destroy
    redirect_to :back
  end

  def add_card
    @magic_project = MagicProject.find(params[:magic_project_id])
    @magic_card_name = MagicCardName.find(params[:magic_card_name_id])
    project_card = MagicProjectCard.find_or_create_by(magic_project_id: @magic_project.id, magic_card_name_id: @magic_card_name.id)
    project_card.quantity = (project_card.quantity || 0) + 1
    project_card.save
    redirect_to :back
  end

  def remove_card
    @magic_project = MagicProject.find(params[:magic_project_id])
    @magic_card_name = MagicCardName.find(params[:magic_card_name_id])
    project_card = MagicProjectCard.find_or_create_by(magic_project_id: @magic_project.id, magic_card_name_id: @magic_card_name.id)
    project_card.quantity = project_card.quantity - 1
    if project_card.quantity == 0
      project_card.destroy
    else
      project_card.save
    end
    redirect_to :back
  end

  # GET /magic_projects/1/edit
  def edit
    @magic_project = MagicProject.includes(magic_project_decks: [:magic_deck]).find(params[:id])
    @project_decks = @magic_project.magic_project_decks
    @all_decks = MagicDeck.all
  end

  # POST /magic_projects
  # POST /magic_projects.json
  def create
    @magic_project = MagicProject.new(magic_project_params)

    respond_to do |format|
      if @magic_project.save
        format.html { redirect_to @magic_project, notice: 'Magic project was successfully created.' }
        format.json { render :show, status: :created, location: @magic_project }
      else
        format.html { render :new }
        format.json { render json: @magic_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magic_projects/1
  # PATCH/PUT /magic_projects/1.json
  def update
    respond_to do |format|
      if @magic_project.update(magic_project_params)
        format.html { redirect_to @magic_project, notice: 'Magic project was successfully updated.' }
        format.json { render :show, status: :ok, location: @magic_project }
      else
        format.html { render :edit }
        format.json { render json: @magic_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magic_projects/1
  # DELETE /magic_projects/1.json
  def destroy
    @magic_project.destroy
    respond_to do |format|
      format.html { redirect_to magic_projects_url, notice: 'Magic project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_project
      @magic_project = MagicProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magic_project_params
      params.require(:magic_project).permit(:name)
    end
end
