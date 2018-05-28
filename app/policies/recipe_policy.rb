class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    user == record.user || user.admin? 
  end

  def edit?
    update?
  end
end
