class MealsController < ApplicationController
    before_action :set_pet
    before_action :set_meal, only: %i[show edit update destroy]
  
    def index
      @meals = Meal.where(pet: @pet).order(date: :desc)
    end
  
    def show; end
  
    def new
      @meal = Meal.new
    end
  
    def edit; end
  
    def create
      @meal = Meal.new(meal_params)
  
      respond_to do |format|
        if @meal.save
          format.html { redirect_to pet_meals_path, notice: 'Meal was successfully created.' }
          format.json { render :show, status: :created, location: @meal }
        else
          format.html { render :new }
          format.json { render json: @meal.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @meal.update(meal_params)
          format.html { redirect_to pet_meals_path, notice: 'Meal was successfully updated.' }
          format.json { render :show, status: :ok, location: @meal}
        else
          format.html { render :edit }
          format.json { render json: @meal.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @meal.destroy
      respond_to do |format|
        format.html { redirect_to pet_meals_path, notice: 'Meal was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_pet
      @pet = Pet.find(params[:pet_id])
    end
  
    def set_meal
      @meal = Meal.find(params[:id])
    end
  
    def meal_params
      params.require(:meal).permit(:pet_id, :food, :quantity, :note, :datetime)
    end
end
