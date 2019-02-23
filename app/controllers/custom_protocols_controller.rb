class CustomProtocolsController < ApplicationController
  def index
  end

  def new
    if params[:parent_id].present?
      @protocol = Protocol.new(status: Protocl::CUSTOM, parent_id: params[:parent_id])
    end
    #elseに関しては別ブランチでrescueする処理作る。
  end

  def create
  end

end
