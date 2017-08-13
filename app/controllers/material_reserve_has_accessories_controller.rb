class MaterialReserveHasAccessoriesController < ApplicationController
  before_action :set_material_reserve_has_accessory, only: [:show, :edit, :update, :destroy]

  # GET /material_reserve_has_accessories
  # GET /material_reserve_has_accessories.json
  def index
    @material_reserve_has_accessories = MaterialReserveHasAccessory.all
  end

  # GET /material_reserve_has_accessories/1
  # GET /material_reserve_has_accessories/1.json
  def show
  end

  # GET /material_reserve_has_accessories/new
  def new
    @material_reserve_has_accessory = MaterialReserveHasAccessory.new
  end

  # GET /material_reserve_has_accessories/1/edit
  def edit
  end

  # POST /material_reserve_has_accessories
  # POST /material_reserve_has_accessories.json
  def create
    @material_reserve_has_accessory = MaterialReserveHasAccessory.new(material_reserve_has_accessory_params)

    respond_to do |format|
      if @material_reserve_has_accessory.save
        format.html { redirect_to @material_reserve_has_accessory, notice: 'Material reserve has accessory was successfully created.' }
        format.json { render :show, status: :created, location: @material_reserve_has_accessory }
      else
        format.html { render :new }
        format.json { render json: @material_reserve_has_accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_reserve_has_accessories/1
  # PATCH/PUT /material_reserve_has_accessories/1.json
  def update
    respond_to do |format|
      if @material_reserve_has_accessory.update(material_reserve_has_accessory_params)
        format.html { redirect_to @material_reserve_has_accessory, notice: 'Material reserve has accessory was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_reserve_has_accessory }
      else
        format.html { render :edit }
        format.json { render json: @material_reserve_has_accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_reserve_has_accessories/1
  # DELETE /material_reserve_has_accessories/1.json
  def destroy
    @material_reserve_has_accessory.destroy
    respond_to do |format|
      format.html { redirect_to material_reserve_has_accessories_url, notice: 'Material reserve has accessory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_reserve_has_accessory
      @material_reserve_has_accessory = MaterialReserveHasAccessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_reserve_has_accessory_params
      params.require(:material_reserve_has_accessory).permit(:material_reserve_id, :accessories_id, :amount)
    end
end
