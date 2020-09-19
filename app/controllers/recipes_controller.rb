class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
         redirect_to recipe_path(@recipe) #, notice: "recipe saved!"
        else
         flash[:eror] = "Your recipe didn't save correctly."
         render :new
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :instruction, :is_vegan)
    end

end
