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
        #need to be logged in before creating a meal
        @meal = Meal.new(meal_params)
        @meal.user_id = session[:user_id]
        if @meal.save
         redirect_to meal_path(@meal)
        else
         render :new  
        end
    end

    private

    def meal_params
        params.require(:meal).permit(:name, :category, :date, :notes, :rating, :recipe_id, recipes_attributes: [:name, :is_vegan, :instruction])
    end

  
end
