require 'spec_helper'

# As a user
# I want to leave a meetup
# So that I'm no longer listed as a member of the meetup
# Acceptance Criteria:
#
# [] I must be authenticated.
# [] I must have already joined the meetup.
# [] I see a message that lets me know I left the meetup successfully.

feature "User must be signed in to leave a meetup" do
  scenario "not signed in, so user gets a prompt to sign in" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/meetup/1'

    signed_in? == false
    click_link('Leave Meetup')

    expect(page).to have_content('You need to sign in if you want to do that!')
    expect(current_path).to eq('/meetup/1')
  end


  scenario "signed in so successfully joins meeting" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/meetup/1'

    signed_in? == true
    joined? == false
    click_link('Leave Meetup')

    expect(page).to have_content('You need to join before you leave!')
    expect(current_path).to eq('/meetup/1')
  end
end

feature "User successfully leaves meetup" do
  scenario "signed in so successfully joins meeting" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/meetup/1'

    signed_in? == true
    joined? == true
    click_link('Leave Meetup')

    expect(page).to have_content('You have successfully left the meetup!')
    expect(current_path).to eq('/')
  end
end
