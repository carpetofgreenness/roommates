# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u=[]

u[0] = User.create(
		"email":"hannah@house.com",
		"password":"000000",
		first_name: "Hannah",
		last_name: "Weinstein"
	)
u[1] = User.create(
	"email":"marine@house.com",
	"password":"000000",
	"first_name": "Marine",
	"last_name": "Kambara"
)
u[2] = User.create(
	"email":"ankur@house.com",
	"password":"000000",
	"first_name": "Ankur",
	"last_name": "Saxena"
)
u[3] = User.create(
	"email":"brittany@house.com",
	"password":"000000",
	"first_name": "Brittany",
	"last_name": "Murray"
)

User.first.houses.create("name":"The Dumpling","description":"our house, in the middle of the street","rent_start":"2017-04-01")
User.first.memberships.first.update_attributes("rent":-1300,"rent_pays_to":true)
User.second.memberships.create("rent":400,"rent_pays_to":false,"house_id":1)
User.third.memberships.create("rent":500,"rent_pays_to":false,"house_id":1)
User.fourth.memberships.create("rent":400,"rent_pays_to":false,"house_id":1)

User.all.each do |user|
	5.times do |t|
		users = User.all - [user]
		t = user.items.create(
			"name":Faker::Commerce.product_name,
			"amount":Faker::Commerce.price,
			"description":Faker::Commerce.department,
			"shared":true,
			"purchased":Faker::Time.between(2.months.ago, Date.today, :all),
			"house_id":1
		)
		users.each do |sharer|
			t.shares.create(
				"user_id":sharer.id,
				"owner":false
			)
		end
		user.shares.where("item_id=?",t.id).first.update_attribute("owner",true)
	end

	5.times do |t|
		users = User.all - [user]
		t = user.items.create(
			"name":Faker::Commerce.product_name,
			"amount":Faker::Commerce.price,
			"description":Faker::Commerce.department,
			"shared":false,
			"purchased":Faker::Time.between(2.months.ago, Date.today, :all),
			"house_id":1
		)
		sharer = users.sample
		t.shares.create(
			"user_id":sharer.id,
			"owner":false
		)
		t.shares.create(
			"user_id":user.id,
			"owner":true
		)
		end
		user.shares.where("item_id=?",t.id).first.update_attribute("owner",true)
	end

end