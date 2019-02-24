class ExperimentController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @labo = Affiliation.find(current_user.affiliation_id)
    @experiments = Experiment.page(params[:page]).per(6)

  end

  def show
    @experiment = Experiment.find(params[:id])
    #コメント機能
    @comments = Comment.where(experiment_id: @experiment.id).order(id: :asc)
    @comment = current_user.comments.build
    @comment = @experiment.comments.build
  end
  
  def comment_create
    @comment = current_user.comments.build(comment_params)
    @comment = @experiment.comments.build(comment_params)
    @comment.save
    redirect_to　experiment_show_path(@experiment)
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
    
    def new_category_save
      category = Category.create(category: @experiment.new_category)
      category.save
      @experiment[:category_id] = category.id
    end
    
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
