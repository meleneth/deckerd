class MagicDecksController < ApplicationController
  before_action :set_magic_deck, only: [:show, :edit, :update, :destroy]

  # GET /magic_decks
  # GET /magic_decks.json
  def index
    @magic_decks = MagicDeck.all
  end

  # GET /magic_decks/1
  # GET /magic_decks/1.json
  def show
  end

  # GET /magic_decks/new
  def new
    @magic_deck = MagicDeck.new
  end

  # GET /magic_decks/1/edit
  def edit
  end

  # POST /magic_decks
  # POST /magic_decks.json
  def create
    @magic_deck = MagicDeck.new(magic_deck_params)

    parser = DeckCardParser.new
    parser.parse(@magic_deck, params["contents"])

    respond_to do |format|
      if @magic_deck.save
        format.html { redirect_to @magic_deck, notice: 'Magic deck was successfully created.' }
        format.json { render :show, status: :created, location: @magic_deck }
      else
        format.html { render :new }
        format.json { render json: @magic_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magic_decks/1
  # PATCH/PUT /magic_decks/1.json
  def update
    respond_to do |format|
      if @magic_deck.update(magic_deck_params)
        format.html { redirect_to @magic_deck, notice: 'Magic deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @magic_deck }
      else
        format.html { render :edit }
        format.json { render json: @magic_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magic_decks/1
  # DELETE /magic_decks/1.json
  def destroy
    @magic_deck.destroy
    respond_to do |format|
      format.html { redirect_to magic_decks_url, notice: 'Magic deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_deck
      @magic_deck = MagicDeck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magic_deck_params
      params.require(:magic_deck).permit(:name, :description)
    end
end
