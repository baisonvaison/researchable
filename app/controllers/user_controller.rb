class UserController < ApplicationController
  before_action :users
  def index
  end

  def show
      @user = User.find(current_user.id)
      @custom_protocols = Protocol.where(user_id: @user.id, status: 1).order(id: :asc) #statusの部分は修正の可能性
      @custom_protocols.each do |custom|
        custom[:author] = User.find(custom.user_id)
        custom[:author] = custom[:author].last_name + " " + custom[:author].first_name
      end
      @experiments = Experiment.where(user_id: @user.id).order(id: :asc)
      @experiments.each do |experiment|
        experiment[:protocol] = Protocol.find(experiment.protocol_id)
        experiment[:category] = Category.find(experiment.id)
      end
  end
  
  private
    def users
      @labo = Affiliation.find(current_user.affiliation_id)
      @users = User.where(affiliation_id: current_user.affiliation_id).order(id: :asc)
      @labo_university = @labo.university
      @labo_department = @labo.department
      @labo_course = @labo.course
    end
end
