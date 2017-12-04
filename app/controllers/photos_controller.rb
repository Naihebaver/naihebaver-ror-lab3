class PhotosController < ApplicationController
before_action :authenticate_user!
	def index
		@photos = Photo.all
		@like = {}
		@photos.each do |photo|
			@vote = Vote.find_by_photo_id(photo.id)
			if !@vote.nil?
				@like[photo.id] = @vote.like
			end
		end
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
		Photo.find(params[:id]).update
  		redirect_to photos_path
	end

	def destroy
		Photo.find(params[:id]).destroy
  		redirect_to photos_path
	end

	def vote
		pp @photo = Photo.find(params[:id])
		pp @vote = Vote.find_by_photo_id(@photo.id)
		
		if @vote == nil
			@like = 1
			Vote.create(user_id: current_user.id, photo_id: @photo.id, like: @like)
		else
			@vote.update(like: @vote.like+1)
		end

		redirect_to photos_path
	end

private

	def photo_params
		params.require(:photo).permit(:user_id,:category_id,:name,:photo)
	end

end
