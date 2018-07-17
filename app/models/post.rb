class Post < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validates :contact, presence: true

	belongs_to :category
end
