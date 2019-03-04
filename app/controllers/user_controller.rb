class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin
      @labo = Affiliation.find(params[:labo_id])
    else
      @labo = Affiliation.find(current_user.affiliation_id)
    end
    @users = User.where(affiliation_id: @labo.id).page(params[:page]).per(12)
  end


  def show
      @user = User.find(params[:id])
      @labo = Affiliation.find (@user.affiliation_id)
      @custom_protocols = Protocol.where(user_id: @user.id, status: 1).order(id: :asc).page(params[:page]).per(6)
      @experiments = Experiment.where(user_id: @user.id).order(id: :asc).page(params[:page]).per(6)
  end
  

end
