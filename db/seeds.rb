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

wally = User.create!(
  legal_name:'wally',
  email: 'wally@notwally.com',
  password:'wally123',
  birthdate: Date.new(2007,5,12)
  )

ruthie = User.create!(
  legal_name:'ruthie',
  email: 'ruthie@notwally.com',
  password:'wally123',
  birthdate: Date.new(1983,5,12)
  )

andrew = Contact.create!(
  first_name:'andrew',
  last_name: 'erlanger',
  user_id: wally.id
  )

lesley = Contact.create!(
  first_name:'les',
  last_name: 'burdock',
  user_id: wally.id
  )

mike = Contact.create!(
  first_name:'mike',
  last_name: 'soap',
  email: 'conact@contact.com',
  relationship: 'mates',
  user_id: wally.id
  )

joe = Contact.create!(
  first_name:'joe',
  last_name: 'jolly',
  email: 'jolly@contact.com',
  relationship: 'enemies',
  user_id: wally.id
  )

ceremony = Ceremony.create!(
  ceremony_type: 'memorial',
  burial_type: 'space_burial',
  user_id: ruthie.id,
  speaker_id: andrew.id,
  music_selector_id: lesley.id
  )

funeral = Ceremony.create!(
  ceremony_type: 'funeral',
  burial_type: 'vinyl_press',
  user_id: wally.id,
  speaker_id: mike.id,
  music_selector_id: joe.id
  )
