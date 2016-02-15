# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Role.delete_all

Role.create([
  {name: 'sys_admin'},
  {name: 'manager'},
  {name: 'guest'}])

User.delete_all

#sys_admin
sys_admin = User.new(email: 'sys@admin.com', first_name: 'sys', last_name: 'admin', password: 'test1234', password_confirmation: 'test1234')
sys_admin.confirm!
sys_admin.save

sys_admin.add_role :sys_admin

#managers
5.times do |i|
  email = 'man' << (i+1).to_s << '@man.com'
  first_name = 'man' << (i+1).to_s
  last_name =  'ager' << (i+1).to_s
  man1 = User.new(email: email, first_name: first_name, last_name: last_name, password: 'test1234', password_confirmation: 'test1234')
  man1.confirm!
  man1.save

  man1.add_role :manager
end


10.times do |i|
  email = 'guest' << (i+1).to_s << '@guest.com'
  first_name = 'gu' << (i+1).to_s
  last_name =  'est' << (i+1).to_s
  man1 = User.new(email: email, first_name: first_name, last_name: last_name, password: 'test1234', password_confirmation: 'test1234')
  man1.confirm!
  man1.save

  man1.add_role :guest
end

#restaurants
Restaurant.delete_all

27.times do |i|
	name = 'Restaurant' << (i+1).to_s
	description = ('a'..'z').to_a.shuffle[0,50].join
	Restaurant.create(name: name, description: description)
end
