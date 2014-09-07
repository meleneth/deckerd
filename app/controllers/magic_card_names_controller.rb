class MagicCardNamesController < ApplicationController
  before_action :set_magic_card_name, only: [:show, :edit, :update, :destroy]

  # GET /magic_card_names
  # GET /magic_card_names.json
  def index
    @magic_card_names = MagicCardName.all
  end

  # GET /magic_card_names/1
  # GET /magic_card_names/1.json
  def show
  end

  # GET /magic_card_names/new
  def new
    @magic_card_name = MagicCardName.new
  end

  # GET /magic_card_names/1/edit
  def edit
  end

  # POST /magic_card_names
  # POST /magic_card_names.json
  def create
    @magic_card_name = MagicCardName.new(magic_card_name_params)

    respond_to do |format|
      if @magic_card_name.save
        format.html { redirect_to @magic_card_name, notice: 'Magic card name was successfully created.' }
        format.json { render :show, status: :created, location: @magic_card_name }
      else
        format.html { render :new }
        format.json { render json: @magic_card_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magic_card_names/1
  # PATCH/PUT /magic_card_names/1.json
  def update
    respond_to do |format|
      if @magic_card_name.update(magic_card_name_params)
        format.html { redirect_to @magic_card_name, notice: 'Magic card name was successfully updated.' }
        format.json { render :show, status: :ok, location: @magic_card_name }
      else
        format.html { render :edit }
        format.json { render json: @magic_card_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magic_card_names/1
  # DELETE /magic_card_names/1.json
  def destroy
    @magic_card_name.destroy
    respond_to do |format|
      format.html { redirect_to magic_card_names_url, notice: 'Magic card name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_card_name
      @magic_card_name = MagicCardName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magic_card_name_params
      params.require(:magic_card_name).permit(:name)
    end
end
