class ExperimentController < ApplicationController
  before_action :authenticate_user!
  before_action :experiments, only:[:index, :show, :destroy]
  
  def index
    @labo = Affiliation.find(current_user.affiliation_id)
  end

  def show
    @experiment = Experiment.find(params[:id])
    @image = Image.find_by(experiment_id: @experiment.id)
    @category = Category.find_by(experiment_id: @experiment_id)
    @protocol = Protocol.find(@experiment.protocol_id)
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
      params.require(:experiment).permit(:title, :date, :overview, :protocol_id, :result, images_attributes: [:image] , category_attributes: [:category])
    end
    
    def experiments
      @experiments = Experiment.all
      @experiments.each do |experiment| #viewで呼び出すために必要なハッシュを追加
        staff = User.find(experiment.user_id)
        experiment[:staff] = staff.last_name + " " + staff.first_name
        category = Category.find(experiment.id)
        experiment[:category] = category[:category]
        protocol = Protocol.find(experiment.protocol_id)
        experiment[:protocol] = protocol.title
      end
    end
end
