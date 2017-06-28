class DailyGoal < ApplicationRecord

	# VALIDATIONS
  validates :value, presence: true
  validate :month_already_in_use

  # CUSTOM METHODS
  def month_already_in_use
  	if DailyGoal.where( goal_id: self.goal_id , user_id: self.user_id , currently_date: self.currently_date ).count > 1
  		errors.add(:currently_date, 'Já existe uma meta diária com essa data.')
  	end
  end

end
