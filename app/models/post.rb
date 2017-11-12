class Post < ApplicationRecord
	belongs_to :user
	has_many :postcomments
	validates :title,:body, presence: true
 	validates :title, length: { in: 5..10 }
end
