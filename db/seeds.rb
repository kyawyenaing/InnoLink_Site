# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


City.destroy_all
 
City.create!([{
  name: "Yangon"
},
{
  name: "Mandalay"
},
{
  name: "Nay Pyi Taw"
}])



Category.destroy_all

Category.create!([{
  name: "Programming"
},
{
  name: "Networking"
},
{
  name: "System Administration"
}])



SalaryRange.destroy_all

SalaryRange.create!([{
  name: "Below 200,000 Ks"
},
{
  name: "200,000 Ks to 500,000 Ks"
},
{
  name: "Above 500,000 Ks"
}])
 

 
Role.destroy_all

Role.create!([{
  name: "Admin",
  description: "Admin"
},
{
  name: "Regular",
  description: "Regular"
},
{
  name: "Owner",
  description: "Owner"
}])