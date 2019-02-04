class ProtocolsController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> feat: create protocol function (before introduce Ajax)
  def index
  end

  def show
    protocol_id = params[:id]
    @protocol = Protocol.find(protocol_id)
<<<<<<< HEAD
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
    protocol = Protocol.new(create_params)
    # 以下の記述は菊池氏の作業が終わり次第戻す
    # protocol.affiliation_id = current_user.affiliation.id
    # protocol.user_id = current_user.id
    protocol.save
  end

  private
  def create_params
    params.require(:protocol).permit(:title,  procedures_attributes: [:text, :_destroy])
  end

end
