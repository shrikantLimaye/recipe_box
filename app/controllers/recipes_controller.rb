class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all.order(created_at: 'DESC')
    end

    def show

    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to @recipe, notice: "Successfully created the recipe!!"
        else
            render 'new', notice: "Recipe Not Saved."
        end
    end

    private
    
    def recipe_params
        params.require(:recipe).permit(:title, :description)
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
end
