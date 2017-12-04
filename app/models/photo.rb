class Photo < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	belongs_to :user
	belongs_to :category
	has_many :votes
end
