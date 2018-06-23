class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @collection = current_user.collection
  end

  def show
    @collection = current_user.collection
    begin
      PdfGeneratorService.new(@collection)
      redirect_back fallback_location: root_path
    rescue => e
      flash[:error] = e.message
      redirect_to collections_path
    end
  end

  def create
    current_user.collection.recipes << current_recipe
    current_user.save
    flash[:notice] = "Recipe was added to collection"
    redirect_back fallback_location: root_path
  end

  def destroy
    current_user.collection.recipes.delete(current_recipe)
    current_user.save
    flash[:notice] = "Recipe was removed from collection"
    redirect_back fallback_location: root_path
  end

  private
  def current_recipe
    Recipe.find(params[:id])
  end
end
