class MaterialReserveHasAmmunitionsController < ApplicationController
  before_action :set_material_reserve_has_ammunition, only: [:show, :edit, :update, :destroy]

  # GET /material_reserve_has_ammunitions
  # GET /material_reserve_has_ammunitions.json
  def index
    @material_reserve_has_ammunitions = MaterialReserveHasAmmunition.all
  end

  # GET /material_reserve_has_ammunitions/1
  # GET /material_reserve_has_ammunitions/1.json
  def show
  end

  # GET /material_reserve_has_ammunitions/new
  def new
    @material_reserve_has_ammunition = MaterialReserveHasAmmunition.new
  end

  # GET /material_reserve_has_ammunitions/1/edit
  def edit
  end

  # POST /material_reserve_has_ammunitions
  # POST /material_reserve_has_ammunitions.json
  def create
    @material_reserve_has_ammunition = MaterialReserveHasAmmunition.new(material_reserve_has_ammunition_params)

    respond_to do |format|
      if @material_reserve_has_ammunition.save
        format.html { redirect_to @material_reserve_has_ammunition, notice: 'Material reserve has ammunition was successfully created.' }
        format.json { render :show, status: :created, location: @material_reserve_has_ammunition }
      else
        format.html { render :new }
        format.json { render json: @material_reserve_has_ammunition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_reserve_has_ammunitions/1
  # PATCH/PUT /material_reserve_has_ammunitions/1.json
  def update
    respond_to do |format|
      if @material_reserve_has_ammunition.update(material_reserve_has_ammunition_params)
        format.html { redirect_to @material_reserve_has_ammunition, notice: 'Material reserve has ammunition was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_reserve_has_ammunition }
      else
        format.html { render :edit }
        format.json { render json: @material_reserve_has_ammunition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_reserve_has_ammunitions/1
  # DELETE /material_reserve_has_ammunitions/1.json
  def destroy
    @material_reserve_has_ammunition.destroy
    respond_to do |format|
      format.html { redirect_to material_reserve_has_ammunitions_url, notice: 'Material reserve has ammunition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_reserve_has_ammunition
      @material_reserve_has_ammunition = MaterialReserveHasAmmunition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_reserve_has_ammunition_params
      params.require(:material_reserve_has_ammunition).permit(:material_reserve_id, :ammunition_id, :amount)
    end
end
