class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user_is_admin
    def index
    end
    
    private
        def current_user_is_admin
            if current_user.admin?
            else
                flash[:alert] = "管理者以外はアクセスできません"
                redirect_to root_path
            end
        end
end
