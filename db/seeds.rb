# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(first_name: "Sara Jane", last_name: "Hanson", email: "sj@sj.com", password: "whatpw", role: 1)
User.create!(first_name: "Sally", last_name: "Hadley", email: "sh@sh.com", password: "whatpw", role: 1)
User.create!(first_name: "Bobby", last_name: "Lou", email: "bl@bl.com", password: "whatpw", role: 0)
User.create!(first_name: "Erin", last_name: "Yeah", email: "yeah@yeah.com", password: "whatpw", role: 1)
User.create!(first_name: "Eddie", last_name: "Martinez", email: "em@em.com", password: "whatpw", role: 0)
