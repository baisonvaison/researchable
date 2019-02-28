class StandardController < ApplicationController
  before_action :authenticate_user!
  def index
    @protocols = Protocol.where(status: Protocol::TEMPLATE).page(params[:page]).per(10)
  end

  def new
    current_user_is_admin
    @protocol = Protocol.new(status: Protocol::TEMPLATE)
    @protocol.procedures.build
  end
end
