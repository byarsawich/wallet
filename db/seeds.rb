# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Reciever.create(name: "SELF")
a = Activity.new(amount: 0, activity_date: Time.now)
r.activities << a
a = Activity.new(amount: 0, activity_date: Time.now-1.month)
r.activities << a
