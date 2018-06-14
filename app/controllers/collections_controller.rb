class CollectionsController < ApplicationController
  def index
  end

  def create
    current_user.collection << params[:id]
    current_user.save
    flash[:notice] = "Recipe was added to collection"
    redirect_to request.referrer
  end
end
