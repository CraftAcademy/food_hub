class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe Sucessfully created"
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

 def recipe_params
   recipe = params.require(:recipe).permit(:title, :description, :ingredients, :directions )
   recipe[:user] = current_user
   recipe
 end
