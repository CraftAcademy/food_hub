class ApplicationController < ActionController::Base
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
    def user_not_authorized
        redirect_to root_path, notice: 'You can NOT do this!'
    end
end
