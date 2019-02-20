class ExperimentController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
    @experiment = current_user.experiments.build
    @experiment.images.build
    @experiment.categories.build
  end
  
  def create
    @experiment = current_user.experiments.build(experiment_params)
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
<<<<<<< HEAD
      params.require(:experiment).permit(:title, :date, :overview, :protocol_id, :result, images_attributes: [:image] , category_attributes: [:category])
=======
      params.require(:experiment).permit(:title, :date, :overview, :protocol_id, :result, :category_id)
>>>>>>> 作成途中
    end

end
