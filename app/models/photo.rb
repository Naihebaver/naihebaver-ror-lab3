class Photo < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	acts_as_votable
	belongs_to :user
	belongs_to :category
	has_many :votes

	validates :photo, :name, presence: true
end
