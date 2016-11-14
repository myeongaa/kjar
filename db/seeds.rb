# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.create( name: "관리자", email: 'kjar@email.com', password: '12345678' )
admin_user.add_role :admin

company_user = User.create( name: "나헤징", email: 'abcd@email.com', password: '12345678' , phone: '01000000000', com: 2)
company_user.add_role :company
Csort.create(name: '병원')
Csort.create(name: '음식점')
Csort.create(name: '미용실')

Company.create( name: "나헤복병원", c_postcode: '54645', c_address: '전라북도 익산시 동서로5길 67', c_daddress: '우리원룸 302호', tel: '063-000-0000', opentime: '12:30am', closetime: '4:00pm' ,csort_id: '1')
