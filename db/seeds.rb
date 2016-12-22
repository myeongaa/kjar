# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.create( name: "관리자", email: 'kjar@email.com', password: '12345678' )
admin_user.add_role :admin

company_user = User.create( name: "홍길동", email: 'abcd@email.com', password: '12345678' , phone: '01012345678', com: 2)
company_user.add_role :company
User.create( name: "나혜진", email: 'dkssud2108@email.com', password: '12345678' , phone: '01029960521')
User.create( name: "이명아", email: 'supermyeonga@email.com', password: '12345678' , phone: '01044424338')
User.create( name: "김종권", email: 'kwon325@email.com', password: '12345678' , phone: '01098336343')
User.create( name: "정해리", email: 'herry@email.com', password: '12345678' , phone: '01063981753')
User.create( name: "민경준", email: 'min@email.com', password: '12345678' , phone: '01028881355')


Csort.create(name: '병원')
Csort.create(name: '음식점')
Csort.create(name: '미용실')
Csort.create(name: '은행')





Company.create( name: "익산FM치과의원", c_postcode: '54638', c_address: '전라북도 익산시 동서로51길 79', c_daddress: '2층', tel: '063-834-2828', opentime: '09:00am', closetime: '6:30pm' ,csort_id: '1' ,runtime: "1200",com_lat:"35.958268", com_lng:"126.978492")

Company.create( name: "익산세종안과의원", c_postcode: '54638', c_address: '전라북도 익산시 무왕로 1082', c_daddress: '3층', tel: '063-832-1001', opentime: '08:30am', closetime: '7:00pm' ,csort_id: '1',runtime:"1200", com_lat:"35.958249", com_lng:"126.977070")

Company.create( name: "원광대학교병원", c_postcode: '54538', c_address: '전라북도 익산시 무왕로 895 원광대학병원', c_daddress: '', tel: '1577-3773', opentime: '09:00am', closetime: '5:00pm' ,csort_id: '1',runtime:"1800", com_lat:"35.964336", com_lng:"126.959708")



Company.create( name: "돈젠", c_postcode: '54645', c_address: '전라북도 익산시 익산대로70길 44', c_daddress: '', tel: '063-851-5858', opentime: '11:00am', closetime: '9:30pm' ,csort_id: '2', runtime:"3600", com_lat:"35.962747",com_lng:"126.957847")

Company.create( name: "익산보쌈식족발", c_postcode: '54624', c_address: '전라북도 익산시 고봉로 165', c_daddress: '', tel: '063-854-8245', opentime: '5:00pm', closetime: '12:00am' ,csort_id: '2' ,runtime:"3600", com_lat:"35.947268", com_lng:"126.966520")

Company.create( name: "익산애슐리 익산홈플러스점", c_postcode: '54545', c_address: '전라북도 익산시 무왕로 1035 홈플러스', c_daddress: '', tel: '063-918-2023', opentime: '11:00am', closetime: '10:00pm' ,csort_id: '2',runtime:"1800", com_lat:"35.958941", com_lng:"126.972488")



Company.create( name: "여성시대헤어 원광대점", c_postcode: '54645', c_address: '전라북도 익산시 익산대로70길 45-1', c_daddress: '1층', tel: '063-853-2838', opentime: '09:30am', closetime: '9:00pm' ,csort_id: '3',runtime:"1800", com_lat:"35.963092", com_lng:"126.958231")

Company.create( name: "짱스헤어", c_postcode: '54645', c_address: '전라북도 익산시 익산대로72길 41-1', c_daddress: '', tel: '063-858-3578', opentime: '10:30am', closetime: '9:00pm' ,csort_id: '3',runtime:"1800", com_lat:"35.961846", com_lng:"126.956566")

Company.create( name: "세종헤어 익산점", c_postcode: '54543', c_address: '전라북도 익산시 고봉로 309 세종헤어샵',c_daddress: '', tel: '063-841-7170', opentime: '10:00am', closetime: '9:00pm' ,csort_id: '3',runtime:"1800", com_lat:"35.959526", com_lng:"126.970990")



Company.create( name: "신한은행 익산중앙점", c_postcode: '54593', c_address: '전라북도 익산시 중앙로3길 11', c_daddress: '', tel: '063-858-1201', opentime: '09:00am', closetime: '4:00pm' ,csort_id: '4',runtime:"1200", com_lat:"35.939883", com_lng:"126.949296")

Company.create( name: "KEB하나은행 원광대출장소", c_postcode: '54536', c_address: '전라북도 익산시 익산대로33길 23', c_daddress: '', tel: '063-834-1111', opentime: '09:00am', closetime: '4:00pm' ,csort_id: '4',runtime:"1200", com_lat:"35.968183", com_lng:"126.958294")

Company.create( name: "우리은행 익산지점", c_postcode: '54594', c_address: '전라북도 익산시 익산대로16길 33 우리은행', c_daddress: '', tel: '063-853-2801', opentime: '09:00am', closetime: '4:00pm' ,csort_id: '4',runtime:"1200", com_lat:"35.940091", com_lng:"126.951073")


Recommend.create( name: "빽다방", lat: "35.963697", lng:"126.957365", re_runtime:"1200")
Recommend.create( name: "이디야커피 원광대점", lat: "35.962092", lng:"126.957222", re_runtime:"900") 
Recommend.create( name: "코인노래방", lat:"35.960313", lng:"126.958378", re_runtime:"900")
Recommend.create( name: "해피데이pc클럽", lat:"35.959749", lng:"126.959755", re_runtime:"3600")
Recommend.create( name: "11번가당구장", lat:"35.960938", lng:"126.957776", re_runtime:"2400")


