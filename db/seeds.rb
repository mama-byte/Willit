# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ceremony.delete_all
Contact.delete_all
User.delete_all

User.create!(legal_name:'wally', email: 'wally@notwally.com', password:'wally123', birthdate: Date.new(2007,5,12))
user = User.create!(legal_name:'ruthie', email: 'ruthie@notwally.com', password:'wally123', birthdate: Date.new(1983,5,12))
andrew = Contact.create!(first_name:'andrew', last_name: 'erlanger', user_id: user.id )
les = Contact.create!(first_name:'les', last_name: 'burdock', user_id: user.id )
ceremony = Ceremony.create!(ceremony_type: 'memorial', user_id: user.id, speaker_id: andrew.id, music_selector_id: les.id)

Contact.create!(
  first_name:'mike',
  last_name: 'soap',
  email: 'conact@contact.com',
  relationship: 'mates',
  user_id: wally.id
  )
Contact.create!(
  first_name:'joe',
  last_name: 'jolly',
  email: 'jolly@contact.com',
  relationship: 'enemies',
  user_id: wally.id
  )
