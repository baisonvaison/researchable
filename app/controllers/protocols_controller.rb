class ProtocolsController < ApplicationController
  def index
  end

  def show
    protocol_id = params[:id]
    @protocol = Protocol.find(protocol_id)
    @produces = Produces.where(protocol_id: protocol_id)
  end

  def new
    if current_user.status = 1
      @protocol = Protocol.new(status: Protocol::TEMPLATE)
    else
      if params[:parent_id].present?
        @protocol = Protocol.new(status: Protocl::CUSTOM, parent_id: params[:parent_id])
      else
        @protocol = Protocol.new
      end
    end
  end

  def create
  end

end
