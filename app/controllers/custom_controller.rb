class CustomController < ApplicationController
  before_action :authenticate_user!
  before_action :customs, only:[:index]
  
  def index
  end

  def show
    @custom = Protocol.where(status: 1, id: params).order(:id)
  end

  def new
  end
  
  private
    def customs
      @customs = Protocol.where(status: 1).order(:id)
      @customs.each do |custom|
        user = User.find(custom.user_id)
        custom[:user] = user.last_name + " " + user.first_name
        user = nil
      end
      @labo = Affiliation.find(current_user.affiliation_id)
    end
  
  
end
