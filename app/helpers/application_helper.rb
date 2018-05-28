module ApplicationHelper
    def user_can_edit_resource? 
        (current_user == @recipe.user || current_user.admin?)
    end
end
