class SearchController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    #keyword = params[:keyword].split(" ")
    @keyword = params[:keyword]
    if current_user.admin
      @experiments = Experiment.page(params[:page]).per(6).order('created_at desc').search_admin(params[:keyword])
      @bases = Protocol.page(params[:page]).per(6).order('created_at desc').search_admin(params[:keyword], 0)
      @customs = Protocol.page(params[:page]).per(6).order('created_at desc').search_admin(params[:keyword], 1)
      @templates = Protocol.page(params[:page]).per(6).order('created_at desc').search_admin(params[:keyword], 2)
    else
      @affiliation = current_user.affiliation
      @experiments = Experiment.page(params[:page]).per(6).order('created_at desc').search(params[:keyword], @user)
      @bases = @affiliation.protocols.page(params[:page]).per(6).order('created_at desc').search(params[:keyword], 0, @user)
      @customs = @affiliation.protocols.page(params[:page]).per(6).order('created_at desc').search(params[:keyword], 1, @user)
      @templates = @affiliation.protocols.page(params[:page]).per(6).order('created_at desc').search(params[:keyword], 2, @user)
    end
  end
end
