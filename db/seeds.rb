# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  id: 1,
  name: "Jaytee",
  email: "jaytee.sanchez@gmail.com",
  address_line_1: "10000 Imperial Hwy Apt E207",
  address_line_2:,
  city: "Downey",
  zip_code: 90242,
  state: "CA",
  password: "a",
  password_confirmation: "a",
  image: "https://avatars1.githubusercontent.com/u/12928206?v=3&s=460"
  )
