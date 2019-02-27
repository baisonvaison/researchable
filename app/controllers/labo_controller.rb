class LaboController < ApplicationController
  include LaboHelper
  #before_action :sign_in_required, only: [:show, :new, :create] 
  before_action :authenticate_user!, only: [:index, :show, :new, :create]
  before_action :current_user_is_admin, only: [:new, :index]

  def index
    @labos = Affiliation.all
  end

  def show
    if current_user.admin && params[:id]
      @labo = Affiliation.find(params[:id])
    else
      @labo = Affiliation.find(current_user.affiliation_id)
    end
  end

  def new
    @affiliation = Affiliation.new
  end

  def create
    @affiliation = Affiliation.new(affiliation_params)
    if Affiliation.find_by(cord: @affiliation[:cord])
      @affiliation=nil
      flash[:alert] = "入力された研究室記号はすでに使用されています。"
      redirect_to new_affiliation_path
    else
      if @affiliation.save
        flash[:notice] = "研究室が登録されました。"
        redirect_to labo_pass_path(id: @affiliation.id)
      else
        @affiliation=nil
        flash[:alert] = "もう一度やり直してください"
        redirect_to new_affiliation_path
      end
    end
  end
  
  private

    def affiliation_params
      params.require(:affiliation).permit(:university, :department, :course, :labo, :cord)
    end

end



