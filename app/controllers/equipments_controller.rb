class EquipmentsController < ApplicationController
  before_action :authenticate_user! # Ensure user is authenticated
  before_action :set_equipment, only: %i[show edit update destroy]

  # GET /equipments
  def index
    @equipments = Equipment.all
  end

  # GET /equipments/1
  def show
  end

  # GET /equipments/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipments/1/edit
  def edit
  end

  # POST /equipments
  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      redirect_to @equipment, notice: 'Equipment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /equipments/1
  def update
    if @equipment.update(equipment_params)
      redirect_to @equipment, notice: 'Equipment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /equipments/1
  def destroy
    @equipment.destroy
    redirect_to equipments_url, notice: 'Equipment was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def equipment_params
    params.require(:equipment).permit(:name, :description, :availability, :cost)
  end
end
