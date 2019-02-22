class ExperimentController < ApplicationController
  PER = 6
  before_action :authenticate_user!
  before_action :experiments, only:[:index]
  
  def index
    @labo = Affiliation.find(current_user.affiliation_id)


  end

  def show
    @experiment = Experiment.find(params[:id])
    @category = Category.find(@experiment.category_id)
    @protocol = Protocol.find(@experiment.protocol_id)
  end

  def new
    @experiment = current_user.experiments.build
  end
  
  def create
    @experiment = current_user.experiments.build(experiment_params)
    new_category_save if !@experiment.new_category.empty?
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
      params.require(:experiment).permit(:title, :image, :date, :overview, :protocol_id, :result, :category_id, :new_category)
    end
    
    def experiments
      @experiments = Experiment.page(params[:page]).per(PER)
      @experiments.each do |experiment| #viewで呼び出すために必要なハッシュを追加
        staff = User.find(experiment.user_id)
        experiment.staff = staff.last_name + " " + staff.first_name
        category = Category.find(experiment.category_id)
        experiment.category = category[:category]
        protocol = Protocol.find(experiment.protocol_id)
        experiment.protocol = protocol.title
      end
    end
    
    def new_category_save
      category = Category.create(category: @experiment.new_category)
      category.save
      @experiment[:category_id] = category.id
    end
end
