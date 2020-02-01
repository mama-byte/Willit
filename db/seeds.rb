# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wolly = User.create!(legal_name:'wally', email: 'wally12@notwally.com', password:'wally123', birthdate: Date.new(2007,5,12))
watches = Valuable.create!(user_id: wolly.id, title:'watch', image_url: 'wallynotwally.com', value:'12', description:"Rolex")
