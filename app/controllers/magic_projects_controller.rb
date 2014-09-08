class MagicProjectsController < ApplicationController
  before_action :set_magic_project, only: [:show, :edit, :update, :destroy]

  # GET /magic_projects
  # GET /magic_projects.json
  def index
    @magic_projects = MagicProject.all
  end

  # GET /magic_projects/1
  # GET /magic_projects/1.json
  def show
    @project_decks = @magic_project.magic_project_decks
    @all_decks = MagicDeck.all
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

  # GET /magic_projects/1/edit
  def edit
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
