class RatingsController < ApplicationController
  def create
    binding.pry
    recipe = Recipe.find(params[:recipe_id])
    rating = recipe.ratings.create(value: params[:rating].to_i)
    if rating.persited?
      render json: { message: 'Thank you for your rating'}, status: :ok
    else
      render json: { message: 'TAn error occured'}, status: :unprocessable_entity

    end
  end
end
