class Store < ApplicationRecord

	# MAP
	belongs_to :user
	has_many :goals
	has_and_belongs_to_many :users

	# VALIDATIONS
  validates :name, length: {maximum: 120 , minimum: 3}, presence: true
  validates :user_ids, presence: true

  # CUSTOM METHODS
  def self.get_user_store user_id
    joins(:user)
    .where('stores.user_id': user_id)
  end

  def self.get_users_store user_id
    select('goals.id , goals.month , users.full_name , goals.name , stores.name as store_name , goals.start_date , goals.end_date , goals.total_value')
    .joins(goals: :store)
    .joins(:users)
    .where('stores_users.user_id': user_id)
  end

end
