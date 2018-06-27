class RatingsController < ApplicationController

  before_action :auth_user

  def create
    recipe = Recipe.find(params[:recipe_id])
    rating = recipe.ratings.create(value: params[:rating], user: current_user)
    if rating.persisted?
      render json: { message: 'Thank you for your rating', average_rating: recipe.calc_average_rating, display_message: "By #{recipe.ratings.count} #{"user".pluralize(recipe.ratings.count)}."}, status: :ok
    else
      render json: { error: 'An error occured'}, status: :unprocessable_entity
    end
  end


  private

  def auth_user
    redirect_to new_user_session_path, notice: "You need to login first" unless user_signed_in?
  end
end
