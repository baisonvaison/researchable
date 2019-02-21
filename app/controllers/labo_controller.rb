class LaboController < ApplicationController
  include LaboHelper
  #before_action :sign_in_required, only: [:show, :new, :create] 
  def index
    @labos = Affiliation.all
  end

  def show
    @labo = Affiliation.find(current_user.affiliation_id)
  end

  def new
    @affiliation = Affiliation.new
  end
  
  def create
    @affiliation = Affiliation.new(affiliation_params)
    if Affiliation.find_by(cord: @affiliation[:cord])
      @affiliation=nil
      flash[:alert] = "入力された研究室記号はすでに使用されています。"
    else
      if @affiliation.save
        flash[:notice] = "研究室が登録されました。"
        render 'labo_pass/index'
        
      else
        @affiliation=nil
        flash[:alert] = "もう一度やり直してください"
        redirect_to new_affiliation_path
      end
    end
 
  end
  
    
  def retrieve_labo
  end
  
  def find_labo
    $labo = Affiliation.find_by(cord: params[:labo][:cord])
    if $labo
      flash[:notice] = '研究室が確認できました。'
      redirect_to new_user_registration
    else
      render "retrieve_labo"
      flash[:alert] = "研究室が見つかりません"
    end
  end

  private
  
    def affiliation_params
      params.require(:affiliation).permit(:university, :department, :course, :labo, :cord)
    end
end
