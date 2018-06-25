class RatingsController < ApplicationController 

  before_action :auth_user

  def create
    recipe = Recipe.find(params[:recipe_id])
    rating = recipe.ratings.create(value: params[:rating].to_i, user: current_user)
    if rating.persisted?
      recipe.calc_average_rating
      render json: { message: 'Thank you for your rating'}, status: :ok
    else
      render json: { error: 'An error occured'}, status: :unprocessable_entity
    end
  end


  private 

  def auth_user
    redirect_to new_user_session_path, notice: "You need to login first" unless user_signed_in?
  end
end
