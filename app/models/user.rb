class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # MAP
  has_many :users
  has_and_belongs_to_many :stores

  # ENUM
  
  enum role: { 
  	'proprietário': 0,
  	'vendedor': 		1
  } 

  def self.get_just_owner
    select(:id , :full_name)
    .where(role: 0)
    .order(:full_name)
  end

  def self.get_sellers
    select(:id , :full_name)
    .where(role: 1)
    .order(:full_name)
  end

end
