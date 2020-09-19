class MealsController < ApplicationController

    def index
        @meals = Meal.all
    end

    def new
        @meal = Meal.new
        @meal.build_recipe
    end

    def create
        @meal = Meal.new(meal_params)
        @meal.user_id = session[:user_id]
        if @meal.save
         redirect_to meal_path(@meal)
        else
         render :index
        end
    end


    private

    def meal_params
        params.require(:meal).permit(:name, :category, :date, :notes, :recipe_id, recipe_attributes: [:name, :is_vegan, :instruction] )
    end
end
