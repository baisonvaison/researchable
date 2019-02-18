class CategoryController < ApplicationController
  def index
  end
  
  def new
    @category =Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if Affiliation.find_by(name: @category[:name])
      flash[:alert] = "入力されたカテゴリー名はすでに使用されています。"
      redirect_to '#'
    else
      if @affiliation.save
        flash[:notice] = "カテゴリーが登録されました。"
        render '#'
        
      else
        flash[:alert] = "もう一度やり直してください"
        redirect_to '#'
      end
    end
 
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
