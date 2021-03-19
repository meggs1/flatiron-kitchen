class IngredientsController < ApplicationController
    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(ingredient_params)
        if @ingredient.valid?
            redirect_to @ingredient
        else
            render 'new'
        end
    end

    def show
        find_ingredient
    end

    def edit
        find_ingredient
    end

    def update
        find_ingredient
        @ingredient.update(ingredient_params)
        if @ingredient.save
            redirect_to @ingredient
        else
            render :edit
        end
    end

    private

    def find_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
