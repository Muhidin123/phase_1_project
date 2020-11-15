User.destroy_all
City.destroy_all
UserTrip.destroy_all

user1 = User.create(name: "Max", user_name: "Max1", password: "greatmax")
user2 = User.create(name: "Tajana", user_name: "Tajana2", password: "tajanacats")
user3 = User.create(name: "Rooha", user_name: "Rooha3", password: "roohapalatine")
user4 = User.create(name: "Mori", user_name: "Mori4", password: "morisuic")
user5 = User.create(name: "Kara", user_name: "Kara5", password: "karahouse")
user6 = User.create(name: "Sunny", user_name: "Sunny6", password: "sunnyuic")

city1 = City.create(name: "Chicago", state: "Illinois", population: 2,700,000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean",  activity: "Chicago Architecture River Cruise" )
city2 = City.create(name: "New York City", state: "New York", population: 8,336,817, area: 305, average_temp: "60F", eat_drink: "steak and burgers", restaurant: "Peter Luger", landmark: "Statue of Liberty", activity: "Visit the MoMA and the MET Museum" )
city3 = City.create(name: "Grand Canyon Village", state: "Arizona", population: 2,130, area: 13.4, average_temp: "63F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
city4 = City.create(name: "Phoenix", state: "Arizona", population: 4,511,000, area: 518, average_temp: "69F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
city5 = City.create(name: "Honolulu", state: "Hawaii", population: 342,933, area: 60.5, average_temp: "75F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )


user_trip1 = UserTrip.create(user_id: user1.id, city_id: city1.id)
user_trip2 = UserTrip.create(user_id: user2.id, city_id: city2.id)
user_trip3 = UserTrip.create(user_id: user3.id, city_id: city4.id)
user_trip4 = UserTrip.create(user_id: user3.id, city_id: city2.id)