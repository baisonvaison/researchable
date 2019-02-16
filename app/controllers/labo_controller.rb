class LaboController < ApplicationController
  require "active_support/core_ext/object/duplicable"
  include LaboHelper
  before_action :sign_in_required, only: [:show]
  def index
  end

  def show
  end

  def new
    session[:ref] = nil #セッションの削除
    @affiliation = Affiliation.new
  end
  
  def create
    @labo_pass = SecureRandom.hex(10).deep_dup #labo_pass/indexページで利用するため変数に保存
    @affiliation = Affiliation.new(affiliation_params)
    @affiliation[:password_digest] = Affiliation.digest(@labo_pass)
    #@affiliation[:password_digest] = SecureRandom.hex(10).deep_dup 
    if @affiliation.save
      flash[:notice] = "研究室が登録されました。"
      render 'labo_pass/index'
    else
      flash[:alert] = "もう一度やり直してください"
      render 'new'
    end
 
  end

  private
  
    def affiliation_params
      params.require(:affiliation).permit(:university, :department, :course, :labo)
    end
end
