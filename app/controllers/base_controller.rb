class BaseController < ApplicationController
  before_action :authenticate_user!
  def index
    
  end

  def show
  end

  def new
    if current_user.admin = 0
      @protocol = Protocol.new
      @protocol.procedures.build
    end
    #elseに関しては別ブランチでrescueする処理作る。
  end
end
