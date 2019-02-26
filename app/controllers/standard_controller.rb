class StandardController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
    current_user_is_admin
    @protocol = Protocol.new(status: Protocol::TEMPLATE)
    @protocol.procedures.build
  end
end
