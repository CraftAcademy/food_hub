class CollectionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.find(current_user.collection)
  end

  def create
    current_user.collection << params[:id]
    current_user.save
    flash[:notice] = "Recipe was added to collection"
    redirect_to request.referrer
  end

  def destroy
    current_user.collection.delete(params[:id])
    current_user.save
    flash[:notice] = "Recipe was removed from collection"
    redirect_to request.referrer
  end
end
