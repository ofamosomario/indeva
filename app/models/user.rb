class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # MAP
  
  has_many :users
  has_many :goals
  has_many :daily_goals
  has_and_belongs_to_many :stores

  # ENUM
  
  enum role: { 
  	'proprietario': 1,
  	'vendedor': 		2
  } 

  # CUSTOM METHODS

  def self.get_just_owner
    select(:id , :full_name)
    .where(role: 1)
    .order(:full_name)
  end

  def self.get_sellers
    select(:id , :full_name)
    .where(role: 2)
    .order(:full_name)
  end

end
