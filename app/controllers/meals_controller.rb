class MealsController < ApplicationController

    def new
        @meal = Meal.new
        @meal.build_recipe
    end

    def create
        @meal = Meal.new(meal_params)
        if @meal.save!
         redirect_to meal_path(@meal)
        else
         render :new
        end
    end


    private

    def meal_params
        params.require(:meal).permit(:name, :category, :date, :notes, :recipe_id, recipe_attributes: [:name, :is_vegan, :instruction] )
    end
end
