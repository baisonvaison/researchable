class ExperimentController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.admin
      @labo = Affiliation.find(params[:labo_id])
    else
      @labo = current_user.affiliation
    end
    # タグで検索
    if params[:tag_name]
      @experiments = @labo.experiments.tagged_with("#{params[:tag_name]}").page(params[:page]).per(6)
    else
      @experiments = @labo.experiments.page(params[:page]).per(6)
    end
  end

  def show
    @experiment = Experiment.find(params[:id])
    #コメント機能
    @comments = Comment.where(experiment_id: @experiment.id).order(id: :asc)
    @comment = current_user.comments.build
  end
  
  def comment_create
    @comment = current_user.comments.build(comment_params)
    @comment[:experiment_id] = params[:id]
    @comment.save
    redirect_to
  end
  
  def new
    @experiment = current_user.experiments.build
    @protocol = Protocol.find(params[:protocol_id])
  end
  
  def create
    @experiment = current_user.experiments.build(experiment_params)
    @experiment[:affiliation_id] = current_user.affiliation_id
    new_category_save if !@experiment.new_category.empty?
    if @experiment.save
      flash[:notice] = "実験結果が登録されました。"
      redirect_to experiment_show_path(@experiment)
    else
      flash[:alert] = 'エラーが発生しました。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
  end
  
  private
    def experiment_params
      params.require(:experiment).permit(:title, :image, :date, :overview, :protocol_id, :result, :category_id, :new_category, :tag_list)
    end
    
    def new_category_save
      category = Category.create(category_name: @experiment.new_category)
      category.save
      @experiment[:category_id] = category.id
    end
    
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
