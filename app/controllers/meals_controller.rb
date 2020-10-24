class MealsController < ApplicationController
    layout "general"

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
        @meal = Meal.new(meal_params)
        @meal.user_id = session[:user_id]
        if @meal.save
            redirect_to meal_path(@meal), notice: "Your #{@meal.name} meal has been saved!"
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
        # @meal.user_id = session[:user_id]
        redirect_to meal_path(@meal) 
    end

    def destroy
        Meal.find(params[:id]).destroy
        redirect_to meals_path
    end


    private

    def meal_params
        params.require(:meal).permit(:name, :category, :date, :notes, :rating, :recipe_id, recipes_attributes: [:recipe_id, :name, :is_vegan, :instruction])
    end

  
end
