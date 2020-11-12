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

#city3 = City.create(name: "Grand Canyon Village", state: "Arizona", population: 2130, area: 13.4, average_temp: "63F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
#city4 = City.create(name: "Phoenix", state: "Arizona", population: 4511000, area: 518, average_temp: "69F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city6 = City.create(name: "Portland", state: "Oregon", population: 2151000, area: 145, average_temp: "63F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city7 = City.create(name: "Savannah", state: "Georgia", population: 145754, area: 109, average_temp: "77F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city8 = City.create(name: "Atlanta", state: "Georgia", population: 5803000, area: 134, average_temp: "72F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city9 = City.create(name: "Detroit", state: "Michigan", population: 667272, area: 143, average_temp: "59F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city10 = City.create(name: "Louisville", state: "Kentucky", population: 624890, area: 275, average_temp: "66F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city12 = City.create(name: "Boston", state: "Massachusetts", population: 710195, area: 46, average_temp: "68F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city12 = City.create(name: "Washington", state: "District of Columbia", population: 720687, area: 61, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city13 = City.create(name: "Miami", state: "Florida", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city14 = City.create(name: "San Francisco", state: "California", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city15 = City.create(name: "Los Angeles", state: "California", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city16 = City.create(name: "St. Louis", state: "Missouri", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city17 = City.create(name: "Indianapolis", state: "Indiana", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city18 = City.create(name: "Denver", state: "Colorado", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city19 = City.create(name: "Minneapolis", state: "minnesota", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean",activity: "Chicago Architecture River Cruise" )
# city20 = City.create(name: "Seattle", state: "Washington", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city21 = City.create(name: "Las Vegas", state: "Nevada", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city22 = City.create(name: "Philadelphia", state: "Pennsylvania", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city23 = City.create(name: "Nashvile", state: "Tennessee", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city24 = City.create(name: "New orleans", state: "Louisiana", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )
# city25 = City.create(name: "Charleston", state: "South Carolina", population: 2700000, area: 230, average_temp: "65F", eat_drink: "deep dish pizza", restaurant: "Giordano's", landmark: "Millennium Park:The Bean", activity: "Chicago Architecture River Cruise" )


user_trip1 = UserTrip.create(user_id: user1.id, city_id: city1.id)
user_trip2 = UserTrip.create(user_id: user2.id, city_id: city2.id)
user_trip3 = UserTrip.create(user_id: user3.id, city_id: city4.id)
user_trip4 = UserTrip.create(user_id: user3.id, city_id: city2.id)