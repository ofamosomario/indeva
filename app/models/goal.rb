class Goal < ApplicationRecord

	# ENUM
	enum month: { 
		'Janeiro': 		1,
		'Fevereiro': 	2,
		'Março': 			3,
		'Abril': 			4,
		'Maio': 			5,
		'Junho': 			6,
		'Julho': 			7,
		'Agosto': 		8,
		'Setembro': 	9,
		'Outubro': 		10,
		'Novembro': 	11,
		'Dezembro': 	12
	}


	# MAP
	belongs_to :user
	belongs_to :store
	has_many :daily_goals

	# VALIDATIONS
  validates :name, length: {maximum: 120 , minimum: 3}, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :month_already_in_use

  # CUSTOM METHODS
  def month_already_in_use
  	if Goal.where( store_id: self.store_id , month: self.month ).count > 1
  		errors.add(:month, 'Já existe uma meta com esse mês.')
  	end
  end


end
