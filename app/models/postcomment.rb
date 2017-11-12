class Postcomment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	validates :comment, presence: true
 	validates :comment, length: { in: 5..100 }
end
