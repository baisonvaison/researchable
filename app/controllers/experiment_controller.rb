class ExperimentController < ApplicationController
  #before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
    @experiment = current_user.experiments.build
    @experiment.images.build
    @experiment.build_category
  end
  
  def create
    #if params[:experiment][:category][:input].empty?
    #  @experiment[:category] = params[:experiment][:category][:selection]
    #else
    #  @experiment[:category] = params[:experiment][:category][:input]
    #end
    #@experiment[:category].delete([:input], [:selection])
    binding.pry
    @experiment = current_user.experiments.build(experiment_params)
    binding.pry
    if @experiment.save
      flash[:notice] = "実験結果が登録されました。"
      redirect_to experiment_path
    else
      flash[:alert] = 'エラーが発生しました。'
      render 'new'
    end
  end
  
  def destroy
  end
  
  private
    def experiment_params
      params.require(:experiment).permit(:title, :date, :overview, :protocol_id, :result, images_attributes: [:image] , category_attributes: [:category])
    end

end
#
