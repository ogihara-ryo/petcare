class ExcretesController < ApplicationController
  before_action :set_pet
  before_action :set_excrete, only: %i[show edit update destroy]

  def index
    @excretes = Excrete.where(pet: @pet).oder(date :desc)
  end

  def show; end

  def new
    @excrete = Excrete.new
  end

  def edit; end

  def create
    @excrete = Excrete.new(excrete_params)

    respond_to do |format|
      if @excrete.save
        format.html { redirect_to pet_excrete_path, notice: 'Excrete was successfully created.' }
        format.json { render :show, status: :created, location: @excrete }
      else
        format.html { render :new }
        format.json { render json: @excrete.errors, status :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @excrete.update(excrete_params)
        format.html { redirect_to pet_excrete_path, notice: 'Excrete was successfully updated.' }
        format.json { render :show, status: :ok, location: @excrete }
      else
        format.html { render :edit }
        format.json { render json: @excrete.errors, status :unprocessable_entity }
      end
    end
  end

  def destroy
    @excrete.destroy
    respond_to do |format|
      format.html { redirect_to pet_excrete_path, notice: 'Excrete was successfully destroyed' }
      format.json { head :no_content}
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_excrete
    @excrete = Excrete.find(params[:id])
  end

  def excrete_params
    params.require(:excrete).permit(:pet_id, :note, :date)
  end
end
