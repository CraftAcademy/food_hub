class ProfilesController < ApplicationController
  def index
    @original_recipes = current_user.recipes.where(original_recipe_id: nil)
    @forked_recipes = current_user.recipes.where.not(original_recipe_id: nil)
  end
end
