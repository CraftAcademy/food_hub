class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(product_params)
    if @recipe.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end

private

 def product_params
   params.require(:recipe).permit(:title, :description, :ingredients, :directions )
 end
