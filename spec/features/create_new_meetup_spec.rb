require 'spec_helper'

# As a user
# I want to create a meetup
# So that I can gather a group of people to discuss a given topic
# Acceptance Criteria:
#
# [] I must be signed in.
# [] I must supply a name.
# [] I must supply a location.
# [] I must supply a description.
# [] I should be brought to the details page for the meetup after I create it.
# [] I should see a message that lets me know that I have created a meetup successfully.

feature "User must be signed in to create a meetup" do
  scenario "not signed in, so user gets a prompt to sign in" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/'

    click_on('New Meetup')

    expect(page).to have_content('You need to sign in if you want to do that!')
    expect(current_path).to eq('/')
  end

  scenario "user is signed in so directs to new page" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "github", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/'

    sign_in_as(user_1)
    click_on('New Meetup')

    expect(current_path).to eq('/new_meetup')
  end
end

feature "New meetup must have a name" do
  scenario "User cannot create a new meetup without the name field entered" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/'

    sign_in_as(user_1)
    click_on('New Meetup')

    fill_in('Location', with: 'Pluto')
    fill_in('Description', with: 'The issues with hyperbolic orbit')
    click_on('Submit')

    expect(page).to have_content('You need to enter a meetup name!')
    expect(current_path).to eq('/new_meetup')
  end
end

feature "New meetup must have a location" do
  scenario "User cannot create a new meetup without the location field entered" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/new_meetup'

    fill_in('Name', with: 'Plutoian Sleep Cycles')
    fill_in('Description', with: 'The issues with hyperbolic orbit')
    click_on('Submit')

    expect(page).to have_content('You need to enter a meetup location!')
    expect(current_path).to eq('/new_meetup')
  end
end

feature "New meetup must have a description" do
  scenario "User cannot create a new meetup without the description field entered" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/new_meetup'

    fill_in('Name', with: 'Plutoian Sleep Cycles')
    fill_in('Location', with: 'Pluto')
    click_on('Submit')

    expect(page).to have_content('You need to enter a meetup description!')
    expect(current_path).to eq('/new_meetup')
  end
end

feature "User will be directed to the page of the created meetup" do
  scenario "Once the meetup is created, there will be a prompt saying the new meetup is created and directed to that page" do
    meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
    user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
    matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
    visit '/new_meetup'

    fill_in('Name', with: 'Plutoian Sleep Cycles')
    fill_in('Location', with: 'Pluto')
    fill_in('Description', with: 'The issues with hyperbolic orbit')
    click_on('Submit')

    expect(page).to have_content('New meetup creation successful!')
    expect(current_path).to eq('/meetup/[:id]')
  end
end
