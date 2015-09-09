require 'spec_helper'

# As a user
# I want to view a list of all available meetups
# So that I can get together with people with similar interests
# Acceptance Criteria:
#
# [] Meetups should be listed alphabetically.
# [] Each meetup listed should link me to the show page for that meetup.

feature "User views the main page" do
  scenario "user sees the available meetups" do
    visit '/'
    save_and_open_page
    expect(page).to have_content(Meetup.all.name)
  end
end

feature "User can go to the meetup page from main page" do
  scenario "user sees the meetup details" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/'

    click_link("Urban Gardening")

    expect(page).to have_content(meetup_1.description)
    expect(current_path).to eq('/meetup/1')
  end
end
