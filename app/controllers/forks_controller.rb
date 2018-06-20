class ForksController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:id])
    @forked_recipe = @recipe.fork(current_user)
    flash[:notice] = "Recipe was sucessfully forked"
    redirect_to edit_recipe_path(@forked_recipe)
  end
end
