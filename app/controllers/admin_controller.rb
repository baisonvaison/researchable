class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user_is_admin
    def index
    end
end
