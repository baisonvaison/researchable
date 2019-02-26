class ProtocolsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_is_admin, only: [:new]

  def index
  end

  def show
    protocol_id = params[:id]
    @protocol = Protocol.find(protocol_id)
    @procedures = Procedure.where(protocol_id: @protocol.id)
  end

  def new
    if current_user.admin = true
      @protocol = Protocol.new(status: Protocol::TEMPLATE)
    else
      @protocol = Protocol.new
    end

    @protocol.procedures.build
  end

  def create
    protocol = Protocol.new(create_params)
    protocol.affiliation_id = current_user.affiliation.id
    protocol.user_id = current_user.id
    protocol.save
  end

  private
  def create_params
    params.require(:protocol).permit(:title, :parent_id, procedures_attributes: [:text, :_destroy])
  end

end
