class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: :edit
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    if (@recipe.user == current_user || current_user.admin?) && @recipe.update(recipe_params)
      flash[:notice] = "You have successfully edit recipe!"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Error updating recipe!" if @recipe.user == current_user
      flash[:alert] = "You can NOT do this!" if @recipe.user != current_user
      render :edit
    end
  end

private

 def recipe_params
   recipe = params.require(:recipe).permit(:title, :description, :ingredients, :directions )
   recipe[:user] = current_user
   recipe
 end

 def authorize_user
  @recipe = Recipe.find(params[:id])
  unless (current_user == @recipe.user || current_user.admin?)
    redirect_to root_path, notice: 'You can NOT do this!'
  end
 end
end