require 'spec_helper'

# As a user
# I want to view the details of a meetup
# So that I can learn more about its purpose
# Acceptance Criteria:
#
# [] I should see the name of the meetup.
# [] I should see a description of the meetup.
# [] I should see where the meetup is located.

feature "User views the meetup page" do
  scenario "user sees the correct title" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/meetup/[:id]'

    expect(page).to have_content "meetup[:name]"
    expect(page).to have_content "meetup[:description]"
    expect(page).to have_content "meetup[:location]"
  end
end
