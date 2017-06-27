class Store < ApplicationRecord

	# MAP
	belongs_to :user
	has_and_belongs_to_many :users

	# VALIDATIONS
  validates :name, length: {maximum: 120 , minimum: 3}, presence: true
end
