class CustomProtocolsController < ApplicationController
  def index
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
