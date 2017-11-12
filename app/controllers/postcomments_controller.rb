class PostcommentsController < ApplicationController
before_action :authenticate_user!

  def create
  	params[:postcomment][:post_id]=params[:post_id]
  	params[:postcomment][:user_id]=current_user.id
  	Postcomment.create(comment_params)
  	redirect_to post_path(params[:post_id])
  end


private
	
	def comment_params
		params.require(:postcomment).permit(:post_id, :user_id, :comment)
	end



end
