class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
        labo_show_path
    end
    def after_sign_up_path_for(resource)
        labo_show_path
    end
    
    def after_inactive_sign_up_path_for(resource)
        thanks_path
    end
    

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
        end
    private
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end
        
        def current_user_is_admin
            if current_user.admin?
            else
                flash[:alert] = "管理者以外はアクセスできません"
                redirect_to root_path
            end
        end
end
