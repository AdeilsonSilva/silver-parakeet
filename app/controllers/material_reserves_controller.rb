class MaterialReservesController < ApplicationController
  before_action :require_login
  before_action :load_reserf
  before_action :set_material_reserve, only: [:show, :edit, :update, :destroy]

  # GET /material_reserves
  # GET /material_reserves.json
  def index
    @material_reserves = @reserve.material_reserve.all
    @material_reserve = @reserve.material_reserve.new
  end

  # GET /material_reserves/1
  # GET /material_reserves/1.json
  def show
  end

  # GET /material_reserves/new
  def new
    @material_reserve = @reserve.material_reserve.new
    @reserves = Reserve.all
  end

  # GET /material_reserves/1/edit
  def edit
  end

  # POST /material_reserves
  # POST /material_reserves.json
  def create
    @material_reserve = @reserve.material_reserve.new(material_reserve_params)
    @material_reserve.reserve_id = @reserve.id

    respond_to do |format|
      if @material_reserve.save
        format.html { redirect_to @reserve, notice: 'Material reserve was successfully created.' }
        format.json { render :show, status: :created, location: @material_reserve }
      else
        format.html { render :new }
        format.json { render json: @material_reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_reserves/1
  # PATCH/PUT /material_reserves/1.json
  def update
    respond_to do |format|
      if @material_reserve.update(material_reserve_params)
        format.html { redirect_to @material_reserve, notice: 'Material reserve was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_reserve }
      else
        format.html { render :edit }
        format.json { render json: @material_reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_reserves/1
  # DELETE /material_reserves/1.json
  def destroy
    @material_reserve.destroy
    respond_to do |format|
      format.html { redirect_to material_reserves_url, notice: 'Material reserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_reserve
      @material_reserve = MaterialReserve.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def load_reserf
      @reserve = Reserve.find(params[:reserf_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def material_reserve_params
      params.require(:material_reserve).permit(:reserve_id)
    end
end
