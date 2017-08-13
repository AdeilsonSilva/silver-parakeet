class ArmamentsController < ApplicationController
  before_action :set_armament, only: [:show, :edit, :update, :destroy]

  # GET /armaments
  # GET /armaments.json
  def index
    @armaments = Armament.all
  end

  # GET /armaments/1
  # GET /armaments/1.json
  def show
  end

  # GET /armaments/new
  def new
    @armament = Armament.new
  end

  # GET /armaments/1/edit
  def edit
  end

  # POST /armaments
  # POST /armaments.json
  def create
    @armament = Armament.new(armament_params)

    respond_to do |format|
      if @armament.save
        format.html { redirect_to @armament, notice: 'Armament was successfully created.' }
        format.json { render :show, status: :created, location: @armament }
      else
        format.html { render :new }
        format.json { render json: @armament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armaments/1
  # PATCH/PUT /armaments/1.json
  def update
    respond_to do |format|
      if @armament.update(armament_params)
        format.html { redirect_to @armament, notice: 'Armament was successfully updated.' }
        format.json { render :show, status: :ok, location: @armament }
      else
        format.html { render :edit }
        format.json { render json: @armament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armaments/1
  # DELETE /armaments/1.json
  def destroy
    @armament.destroy
    respond_to do |format|
      format.html { redirect_to armaments_url, notice: 'Armament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armament
      @armament = Armament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def armament_params
      params.require(:armament).permit(:serial_number, :manufacturer)
    end
end
