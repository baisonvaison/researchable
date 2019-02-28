class CustomController < ApplicationController
  before_action :authenticate_user!

  def index
    @labo =
    if current_user.admin
      Affiliation.find(params[:labo_id])
    else
      current_user.affiliation
    end

    @protocols = Protocol.where(affiliation_id: @labo.id).where(status: Protocol::CUSTOM).page(params[:page]).per(10)
  end

  def new
    if params[:parent_id].present?
      @protocol = Protocol.new(status: Protocol::CUSTOM, parent_id: params[:parent_id])

      protocol_elements = []
      procedures = Procedure.where(protocol_id: params[:parent_id])
      procedures.each do |procedure|
        protocol_element = {text: procedure.text }
        protocol_elements << protocol_element
      end
      @protocol.procedures.build(protocol_elements)
    end
    #elseに関しては別ブランチでrescueする処理作る。
  end

end
