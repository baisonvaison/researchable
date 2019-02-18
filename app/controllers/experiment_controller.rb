class ExperimentController < ApplicationController
  #before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
    @experiment = current_user.experiments.build
  end
  
  def create
    binding.pry
    @experiment = current_user.experiments.build(experiment_params)
    binding.pry
    if @experiment.save
      flash[:notice] = "実験結果が登録されました。"
      redirect_to 'experiment/show'
    else
      flash[:alert] = 'エラーが発生しました。'
      render 'new'
    end
  end
  
  def destroy
  end
  
  private
    def experiment_params
      params.require(:experiment).permit(:title, :date, :overview, :result)
    end

end
