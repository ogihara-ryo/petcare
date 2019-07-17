class PhysicalsController < ApplicationController
  before_action :set_pet
  before_action :set_physical, only: %i[show edit update destroy]

  def index
    @physicals = Physical.where(pet: @pet).order(date: :desc)
  end

  def show; end

  def new
    @physical = Physical.new
  end

  def edit; end

  def create
    @physical = Physical.new(physical_params)

    respond_to do |format|
      if @physical.save
        format.html { redirect_to pet_physicals_path, notice: 'Physical was successfully created.' }
        format.json { render :show, status: :created, location: @physical }
      else
        format.html { render :new }
        format.json { render json: @physical.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @physical.update(physical_params)
        format.html { redirect_to pet_physicals_path, notice: 'Physical was successfully updated.' }
        format.json { render :show, status: :ok, location: @physical }
      else
        format.html { render :edit }
        format.json { render json: @physical.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @physical.destroy
    respond_to do |format|
      format.html { redirect_to pet_physicals_path, notice: 'Physical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_physical
    @physical = Physical.find(params[:id])
  end

  def physical_params
    params.require(:physical).permit(:pet_id, :height, :weight, :note, :date)
  end
end
