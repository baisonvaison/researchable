class ProtocolsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_is_admin, only: [:new]

  def show
    @protocol = Protocol.find(params[:id])
    @procedures = Procedure.where(protocol_id: @protocol.id).order(:position)
  end

  def create
    protocol = Protocol.new(create_params)
    protocol.status = status_params ? status_params.values.first.to_i : 0
    protocol.affiliation_id = current_user.affiliation.id
    protocol.user_id = current_user.id
    new_category_save if !protocol.new_category.empty?
    protocol.save
    redirect_to protocol_path(protocol.id)
  end

  private
  def create_params
    params.require(:protocol).permit(:title, :parent_id, :category_id, :new_category, :tag_list, procedures_attributes: [:text, :_destroy])
  end

  def status_params
    params.require(:protocol).permit(:status)
  end

  def new_category_save
    category = Category.create(category_name: protocol.new_category)
    category.save
    protocol.category_id = category.id
  end

end
