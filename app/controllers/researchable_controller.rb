class ResearchableController < ApplicationController
  def index
  end

  def show
  end

  def new
  end


  def create
    Tweet.create(researchable_params)
  end


  def destroy
  end


  def edit
    @researchable = Researchable.find(params[:id])
  end

  def update
    researchable = Researchable.find(params[:id])
  end


  private
  def researchable_params
    params.permit(:name, :image, :text)
  end


end
