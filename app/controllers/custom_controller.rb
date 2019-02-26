class CustomController < ApplicationController
  before_action :authenticate_user!
  before_action :customs, only:[:index]
  
  def index
  end

  def show
    @custom = Protocol.find params[:id]
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
  
  private
    def customs
      @customs = Protocol.where(status: 1).order(:id)
      @customs = Protocol.page(params[:page]).per(12)
      @labo = Affiliation.find(current_user.affiliation_id)
    end
  
  
end
