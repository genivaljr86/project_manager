# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
admin_user = User.create(:email => "ernane.sena@gmail.com",
                         :password => "123456", :first_name => "ernane", :last_name => "sena")
admin_user.admin = true
admin_user.confirm!

Customer.create(
  :name => "Talento Design",
  :email_main => "contato@talentodesign.com.br",
  :phone => "999999999",
  :address => "Conjunto Maguari Alameda 03",
  :user_cpanel => "talentodec",
  :password_cpanel => "designer2802",
  :email_twitter => "contato@talentodesign.com.br",
  :password_twitter => "123456",
  :user_facebook => "contato@talentodesign.com.br",
  :password_facebook => "123456",
  :server => "Locaweb"
)

Project.create(:title => "Ticketee Beta", :customer_id => 1)
Project.create(:title => "Ticketee Alpha", :customer_id => 1)
Project.create(:title => "Ticketee Realese Candidate", :customer_id => 1)
