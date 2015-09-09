# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
Meetup.create(name: "Rock Climbing", description: "Let's talk about the best places in NH to rock climb", location: "Concord, NH")
Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")

User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
User.create(provider: "GitHub", uid: "23456", username: "Allison Krause", email: "akrause@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
User.create(provider: "GitHub", uid: "34567", username: "Kim Bo", email: "kbo123@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
User.create(provider: "GitHub", uid: "45678", username: "Alex Rice", email: "arice@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")

Matchup.create(user_id: 1, meetup_id:1)
Matchup.create(user_id: 4, meetup_id:2)
Matchup.create(user_id: 2, meetup_id:1)
Matchup.create(user_id: 3, meetup_id:2)
