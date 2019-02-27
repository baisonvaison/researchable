class BaseController < ApplicationController
  before_action :authenticate_user!
  def index
    @labo =
    if current_user.admin
      Affiliation.find(params[:labo_id])
    else
      current_user.affiliation
    end

    @protocols = Protocol.where(affiliation_id: @labo.id).where(status: Protocol::BASE).page(params[:page]).per(10)
  end

  def show
    @protocol = Protocol.find(params[:id])
  end

  def new
    if current_user.admin = 0
      @protocol = Protocol.new
      @protocol.procedures.build
    end
    #elseに関しては別ブランチでrescueする処理作る。
  end
end
