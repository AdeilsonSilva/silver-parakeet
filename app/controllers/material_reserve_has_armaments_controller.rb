class MaterialReserveHasArmamentsController < ApplicationController
  before_action :set_material_reserve_has_armament, only: [:show, :edit, :update, :destroy]

  # GET /material_reserve_has_armaments
  # GET /material_reserve_has_armaments.json
  def index
    @material_reserve_has_armaments = MaterialReserveHasArmament.all
  end

  # GET /material_reserve_has_armaments/1
  # GET /material_reserve_has_armaments/1.json
  def show
  end

  # GET /material_reserve_has_armaments/new
  def new
    @material_reserve_has_armament = MaterialReserveHasArmament.new
  end

  # GET /material_reserve_has_armaments/1/edit
  def edit
  end

  # POST /material_reserve_has_armaments
  # POST /material_reserve_has_armaments.json
  def create
    @material_reserve_has_armament = MaterialReserveHasArmament.new(material_reserve_has_armament_params)

    respond_to do |format|
      if @material_reserve_has_armament.save
        format.html { redirect_to @material_reserve_has_armament, notice: 'Material reserve has armament was successfully created.' }
        format.json { render :show, status: :created, location: @material_reserve_has_armament }
      else
        format.html { render :new }
        format.json { render json: @material_reserve_has_armament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_reserve_has_armaments/1
  # PATCH/PUT /material_reserve_has_armaments/1.json
  def update
    respond_to do |format|
      if @material_reserve_has_armament.update(material_reserve_has_armament_params)
        format.html { redirect_to @material_reserve_has_armament, notice: 'Material reserve has armament was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_reserve_has_armament }
      else
        format.html { render :edit }
        format.json { render json: @material_reserve_has_armament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_reserve_has_armaments/1
  # DELETE /material_reserve_has_armaments/1.json
  def destroy
    @material_reserve_has_armament.destroy
    respond_to do |format|
      format.html { redirect_to material_reserve_has_armaments_url, notice: 'Material reserve has armament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_reserve_has_armament
      @material_reserve_has_armament = MaterialReserveHasArmament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_reserve_has_armament_params
      params.require(:material_reserve_has_armament).permit(:armaments_id, :material_reserve_id, :amount)
    end
end
