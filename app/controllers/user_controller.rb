class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :users
  def index
      @users = User.page(params[:page]).per(12)
  end

  def show
      @user = User.find(params[:id])
      custom_protocols = Protocol.where(user_id: @user.id, status: 1).order(id: :asc) 
      @custom_protocols = custom_protocols.page(params[:page]).per(6)
      experiments = Experiment.where(user_id: @user.id).order(id: :asc)
      @experiments = experiments.page(params[:page]).per(6)
  end
  
  private
    def users
      @labo = Affiliation.find(current_user.affiliation_id)
  end
end
