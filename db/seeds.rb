# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!({
  first_name: "Alex",
  email: "alex@gmail.com",
  password: "012345678"
})
User.create!({
  first_name: "Paula",
  email: "paula@gmail.com",
  password: "012345678"
})
