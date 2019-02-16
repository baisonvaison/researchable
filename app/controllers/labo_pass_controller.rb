class LaboPassController < ApplicationController
  def index
      if request.path_info != session[:ref]#リロードされたらパスワードが変わってしまう
        session[:ref] = request.path_info
      else
        render '/labo/index'
      end
  end
end
