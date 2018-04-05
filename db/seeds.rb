# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require './app/models/user'
require './app/models/country'
require './app/models/image'

ActiveRecord::Base.connection.reset_pk_sequence!(:table_name)

# CSV.foreach('./data/users.csv', headers: true, header_converters: :symbol) do |row|
#   User.create!(username:   row[:username],
#                password:       row[:password],
#                email:      row[:email],
#                role:       row[:role]
#              )
# end

User.create!([{username: "admin", password: "test", email: "admin@email.com", role: 1}, {username: "user", password: "test", email: "user@email.com", role: 0}])

CSV.foreach('./data/countries.csv', headers: true, header_converters: :symbol) do |row|
  Country.create!(name:   row[:name])
end

CSV.foreach('./data/images.csv', headers: true, header_converters: :symbol) do |row|
  Image.create!(name: row[:name],
               url:  row[:url]
             )
end
