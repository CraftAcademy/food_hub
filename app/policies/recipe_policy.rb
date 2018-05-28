class RecipePolicy < ApplicationPolicy

  def update?
    user == record.user || user.admin? 
  end

  def edit?
    update?
  end
end
