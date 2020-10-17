class MealsController < ApplicationController

    def index
        @meals = Meal.all
    end

    def show
        @meal = Meal.find_by_id(params[:id])
    end

    def new
        @meal = Meal.new
        @meal.recipes.build
    end

    def create
        binding.pry
        @meal = Meal.new(meal_params)
        @meal.user_id = session[:user_id]
        if @meal.save
         redirect_to meal_path(@meal)
        else
         render :new  
        end
    end

    def edit
        @meal = Meal.find_by_id(params[:id])
        render :edit
    end

    def update
        @meal = Meal.find_by_id(params[:id])
        @meal.update(meal_params)
        redirect_to meal_path(@meal) 
    end

    private

    def meal_params
        params.require(:meal).permit(:name, :category, :date, :notes, :rating, :recipe_id, recipes_attributes: [:recipe_id, :name, :is_vegan, :instruction])
    end

  
end
