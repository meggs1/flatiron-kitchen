class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to @recipe
        else
            render 'new'
        end
    end

    def show
        find_recipe
    end

    def edit
        find_recipe
    end

    def update
        find_recipe
        @recipe.update(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :edit
        end
    end

    private

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end
end

