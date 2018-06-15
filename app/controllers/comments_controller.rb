class CommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    Comment.create(body: params[:comment][:body], recipe_id: recipe.id, user: current_user)
    flash[:notice] = 'Thank you for your feedback'
    redirect_to recipe_path(recipe)
  end
end
