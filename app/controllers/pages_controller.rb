class PagesController < ApplicationController
  def index
  	pp @posts = Post.all
  end
end
