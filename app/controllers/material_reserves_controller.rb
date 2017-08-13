class MaterialReservesController < ApplicationController
  before_action :set_material_reserf, only: [:show, :edit, :update, :destroy]

  # GET /material_reserves
  # GET /material_reserves.json
  def index
    @material_reserves = MaterialReserve.all
  end

  # GET /material_reserves/1
  # GET /material_reserves/1.json
  def show
  end

  # GET /material_reserves/new
  def new
    @material_reserf = MaterialReserve.new
  end

  # GET /material_reserves/1/edit
  def edit
  end

  # POST /material_reserves
  # POST /material_reserves.json
  def create
    @material_reserf = MaterialReserve.new(material_reserf_params)

    respond_to do |format|
      if @material_reserf.save
        format.html { redirect_to @material_reserf, notice: 'Material reserve was successfully created.' }
        format.json { render :show, status: :created, location: @material_reserf }
      else
        format.html { render :new }
        format.json { render json: @material_reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_reserves/1
  # PATCH/PUT /material_reserves/1.json
  def update
    respond_to do |format|
      if @material_reserf.update(material_reserf_params)
        format.html { redirect_to @material_reserf, notice: 'Material reserve was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_reserf }
      else
        format.html { render :edit }
        format.json { render json: @material_reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_reserves/1
  # DELETE /material_reserves/1.json
  def destroy
    @material_reserf.destroy
    respond_to do |format|
      format.html { redirect_to material_reserves_url, notice: 'Material reserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_reserf
      @material_reserf = MaterialReserve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_reserf_params
      params.fetch(:material_reserf, {})
    end
end
