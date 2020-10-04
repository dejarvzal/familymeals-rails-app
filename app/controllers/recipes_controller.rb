class RecipesController < ApplicationController

    def index
        if  @meal = Meal.find_by(params[:meal_id])
            @recipes = @meal.recipes
        else
        @recipes = Recipe.all
        end
    end

    def new
        @meal = Meal.find_by(params[:meal_id])
        @recipe = @meal.recipes.build
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
         redirect_to recipe_path(@recipe)
        else
        #  flash[:eror] = "Your recipe didn't save correctly."
         render :new
        end
    end

    def show
        @recipe = Recipe.find_by_id(params[:id])
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :instruction, :is_vegan, :meal_id)
    end

end
