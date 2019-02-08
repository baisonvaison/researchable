class ProtocolsController < ApplicationController
  def index
  end

  def show
    protocol_id = params[:id]
    @protocol = Protocol.find(protocol_id)
    @produces = Procedures.where(protocol_id: protocol_id)
  end

  def new
    # deviseでの実装が完了するまでのつなぎ。
    current_user = 1
    if current_user = 1
    #if current_user.status = 1
      @protocol = Protocol.new(status: Protocol::TEMPLATE)
    else
      if params[:parent_id].present?
        @protocol = Protocol.new(status: Protocl::CUSTOM, parent_id: params[:parent_id])
      else
        @protocol = Protocol.new
      end
    end

    @protocol.procedures.build
  end

  def create
  end

  private
  def protocol_create_params
    params.require(:protocol).permit(:title, procedures_attributes: [:id, :file, :_destroy])
  end

end
