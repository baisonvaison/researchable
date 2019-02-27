class LaboPassController < ApplicationController
  before_action :authenticate_user!
  def index
    @labo = Affiliation.find(params[:id])
  end
end
