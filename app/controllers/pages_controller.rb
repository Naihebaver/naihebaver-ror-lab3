class PagesController < ApplicationController
  def index
  	 @posts = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end
end
