class MagicCardTypesController < ApplicationController
  before_action :set_magic_card_type, only: [:show, :edit, :update, :destroy]

  # GET /magic_card_types
  # GET /magic_card_types.json
  def index
    @magic_card_types = MagicCardType.all
  end

  # GET /magic_card_types/1
  # GET /magic_card_types/1.json
  def show
  end

  # GET /magic_card_types/new
  def new
    @magic_card_type = MagicCardType.new
  end

  # GET /magic_card_types/1/edit
  def edit
  end

  # POST /magic_card_types
  # POST /magic_card_types.json
  def create
    @magic_card_type = MagicCardType.new(magic_card_type_params)

    respond_to do |format|
      if @magic_card_type.save
        format.html { redirect_to @magic_card_type, notice: 'Magic card type was successfully created.' }
        format.json { render :show, status: :created, location: @magic_card_type }
      else
        format.html { render :new }
        format.json { render json: @magic_card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magic_card_types/1
  # PATCH/PUT /magic_card_types/1.json
  def update
    respond_to do |format|
      if @magic_card_type.update(magic_card_type_params)
        format.html { redirect_to @magic_card_type, notice: 'Magic card type was successfully updated.' }
        format.json { render :show, status: :ok, location: @magic_card_type }
      else
        format.html { render :edit }
        format.json { render json: @magic_card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magic_card_types/1
  # DELETE /magic_card_types/1.json
  def destroy
    @magic_card_type.destroy
    respond_to do |format|
      format.html { redirect_to magic_card_types_url, notice: 'Magic card type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_card_type
      @magic_card_type = MagicCardType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magic_card_type_params
      params.require(:magic_card_type).permit(:name)
    end
end
