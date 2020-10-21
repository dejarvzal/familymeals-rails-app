class RecipesController < ApplicationController

    def index
        if  params[:recipe_id]
            @meal = Meal.find_by(params[:meal_id])
            @recipes = @meal.recipes
        else
        @recipes = Recipe.all
        end
    end

    def new
        @meal = Meal.find(params[:meal_id])
        @recipe = @meal.recipes.build
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
         redirect_to recipe_path(@recipe)
        else
         render :new
        end
    end

    def show
        @recipe = Recipe.find_by_id(params[:id])
    end

    private

    def recipe_params
        params.require(:recipe).permit(:meal_id, :name, :is_vegan, :instruction)
    end

end
