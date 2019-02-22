class CustomController < ApplicationController
  before_action :authenticate_user!
  before_action :customs, only:[:index]
  
  def index
  end

  def show
    @custom = Protocol.find params[:id]
  end

  def new
  end
  
  private
    def customs
      @customs = Protocol.where(status: 1).order(:id)
      @customs = Protocol.page(params[:page]).per(12)
      @labo = Affiliation.find(current_user.affiliation_id)
    end
  
  
end
