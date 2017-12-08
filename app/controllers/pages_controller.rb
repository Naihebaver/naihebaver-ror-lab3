class PagesController < ApplicationController
  def index
  	 @posts = Post.all.paginate(:page => params[:page], :per_page => 4)
  end
end
