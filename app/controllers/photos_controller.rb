class PhotosController < ApplicationController
before_action :authenticate_user!
	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		params[:photo][:category_id] = params[:category_id]
		params[:photo][:user_id] = current_user.id
		@photo = Photo.create(photo_params)
		redirect_to photos_path
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update(photo_params)
      		redirect_to photos_path
    	else
      		render 'edit'
    	end
	end

	def destroy
		Photo.find(params[:id]).destroy
  		redirect_to photos_path
	end

	def upvote
		@photo = Photo.find(params[:id])
		@photo.upvote_by(current_user)
		redirect_to photos_path
	end

	def downvote
		@photo = Photo.find(params[:id])
		@photo.downvote_by(current_user)
		redirect_to photos_path
	end

private

	def photo_params
		params.require(:photo).permit(:user_id,:category_id,:name,:photo)
	end

end
