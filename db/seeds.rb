# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
SubReddit.create(:name => "hot_reddit")
SubReddit.create(:name => "nasty_reddit")

# User.create(:first_name => "Caleb"
#             :last_name => "Francis"
#             :username => "calebonesimus")
