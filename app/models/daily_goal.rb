class DailyGoal < ApplicationRecord

	#MAP
  belongs_to :goal
	belongs_to :user

	# VALIDATIONS
  validates :value, presence: true
  validate :month_already_in_use
  validate :data_between_ok

  # CUSTOM METHODS
  def self.get_sellers_goals goal_id
    select('users.full_name , sum(daily_goals.value) as value')
    .joins(:user)
    .where(goal_id: goal_id , 'users.role': 2)
    .group('users.full_name')
  end
  
  def month_already_in_use
  	if DailyGoal.where( goal_id: self.goal_id , user_id: self.user_id , currently_date: self.currently_date ).count > 1
  		errors.add(:currently_date, 'Já existe uma meta diária com essa data.')
  	end
  end

  def data_between_ok
  	@goal = Goal.select(:start_date , :end_date).where( id: self.goal_id )

  	if !@goal.empty?
	  	if self.currently_date < @goal.first.start_date || self.currently_date > @goal.first.end_date
	  		errors.add(:currently_date, "A data dessa meta diária está fora das específicadas pela meta. A data deverá estar entre #{@goal.first.start_date} e #{@goal.first.end_date}")
	  	end
  	end
  end

  # TODO: Verificar se a data do currently_date está entre as datas da GOAL.
end
