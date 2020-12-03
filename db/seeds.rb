# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "\n == Creating admin profile =="
user = User.create(:email => "admin@gmail.com", :password => "admin123")
user.update(:confirmation_token => nil, :confirmed_at => Date.today)
puts "\n == Admin profile created =="


puts "\n Seeding room types"
[
    {"name": "Single"},
    {"name": "Double"},
    {"name": "Triple"},
    {"name": "Quad"},
    {"name": "Queen"},
    {"name": "Studio"},
    {"name": "FAMILY"},
].each do |room_type|
  RoomType.find_or_create_by(room_type)
end




