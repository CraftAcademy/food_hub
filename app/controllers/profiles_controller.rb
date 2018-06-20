class ProfilesController < ApplicationController
  def index
    @original_recipes = current_user.recipes
  end
end
