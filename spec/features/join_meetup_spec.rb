require 'spec_helper'

# As a user
# I want to join a meetup
# So that I can talk to other members of the meetup
# Acceptance Criteria:
#
# [] I must be signed in.
# [] From a meetups detail page, I should click a button to join the meetup.
# [] I should see a message that tells let's me know when I have successfully joined a meetup.

feature "User must be signed in to join a meetup" do
  scenario "not signed in, so user gets a prompt to sign in" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/meetup/[:id]'

    signed_in? == false
    click_link('Join Meetup')

    expect(page).to have_content('You need to sign in if you want to do that!')
    expect(current_path).to eq('/meetup/[:id]')
  end


  scenario "signed in so successfully joins meeting" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/meetup/[:id]'

    signed_in? == true
    click_link('Join Meetup')

    expect(page).to have_content('Meetup joined!')
    expect(current_path).to eq('/meetup/[:id]')
  end
end
