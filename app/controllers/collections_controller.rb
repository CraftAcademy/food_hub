class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.collection.recipes
  end

  def create
    current_user.collection.recipes << current_recipe
    current_user.save
    flash[:notice] = "Recipe was added to collection"
    redirect_to request.referrer
  end

  def destroy
    current_user.collection.recipes.delete(current_recipe)
    current_user.save
    flash[:notice] = "Recipe was removed from collection"
    redirect_to request.referrer
  end

  private
  def current_recipe
    Recipe.find(params[:id])
  end
end
