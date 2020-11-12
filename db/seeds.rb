User.destroy_all
City.destroy_all
UserTrip.destroy_all


user1 = User.create(name: "Max", user_name: "Max1", password: "greatmax")
user2 = User.create(name: "Tajana", user_name: "Tajana2", password: "tajanacats")
user3 = User.create(name: "Rooha", user_name: "Rooha3", password: "roohapalatine")
user4 = User.create(name: "Mori", user_name: "Mori4", password: "morisuic")
user5 = User.create(name: "Kara", user_name: "Kara5", password: "karahouse")
user6 = User.create(name: "Sunny", user_name: "Sunny6", password: "sunnyuic")


city1 = City.create(name: "Chicago", state: "Illinois", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean",  activity: "Chicago Architecture River Cruise")
city2 = City.create(name: "New York City", state: "New York", population: 8336817, area: 305, average_temp: "60F", eat_drink: "steak and burgers", restaurant: "Peter Luger", landmark: "Statue of Liberty", activity: "Visit the MoMA and the MET Museum")
city3 = City.create(name: "Miami", state: "Florida", population: 470914, area: 230, average_temp: "84F", eat_drink: "Haitian food", restaurant: "La Fourchette Restaurant", landmark: "Al Capone's Mansion", activity: "visit culturally diverse neighborhoods")
city4 = City.create(name: "Honolulu", state: "Hawaii", population: 342933, area: 60.5, average_temp: "75F", eat_drink: "Hawaiian Plate", restaurant: "Helena's Hawaiian Food", landmark: "Pearl Harbor National Memorial", activity: "visit museums, volcanoes and beaches")
city5 = City.create(name: "Austin", state: "Texas", population: 988218, area: 327, average_temp: "79F", eat_drink: "BBQ", restaurant: "Franklin Barbecue", landmark: "Mount Bonnell", activity: "visit street art and murals in SoCo District")


user_trip1 = UserTrip.create(user_id: user1.id, city_id: city1.id)
user_trip2 = UserTrip.create(user_id: user2.id, city_id: city2.id)
user_trip3 = UserTrip.create(user_id: user3.id, city_id: city4.id)
user_trip4 = UserTrip.create(user_id: user3.id, city_id: city2.id)