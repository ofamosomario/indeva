# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
	{full_name: 'Mário Augusto Carvalho' , email: 'tkyakow@gmail.com' , password: '123mudar' , password_confirmation: '123mudar' , role: 0},
	{full_name: 'Ricardo Reis' , email: 'ricardo@gmail.com' , password: '123mudar' , password_confirmation: '123mudar' , role: 2},
	{full_name: 'Bernardo' , email: 'bernardo@gmail.com' , password: '123mudar' , password_confirmation: '123mudar' , role: 2}
])

Store.create(name: 'ToyLand' , user_id: 1)