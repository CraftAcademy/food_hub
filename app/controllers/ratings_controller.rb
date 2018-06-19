class RatingsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    rating = recipe.ratings.create(value: params[:rating].to_i, user: current_user)
    if rating.persisted?
      render json: { message: 'Thank you for your rating'}, status: :ok
    else
      render json: { error: 'An error occured'}, status: :unprocessable_entity

    end
  end
end
