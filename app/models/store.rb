class Store < ApplicationRecord

	# MAP
	belongs_to :user
	has_many :goals
	has_and_belongs_to_many :users

	# VALIDATIONS
  validates :name, length: {maximum: 120 , minimum: 3}, presence: true

  # CUSTOM METHODS
  def self.get_user_store user_id
    joins(:users)
    .where('stores_users.user_id': user_id)
  end

end
