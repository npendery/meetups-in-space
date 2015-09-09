require 'spec_helper'

# As a user
# I want to leave comments on a meetup
# So that I can communicate with other members of the group
# Acceptance Criteria:
#
# [] I must be authenticated.
# [] I must have already joined the meetup.
# [] I can optionally provide a title for my comment.
# [] I must provide the body of my comment.
# [] I should see my comment listed on the meetup show page.
# [] Comments should be listed most recent first.

# feature "User must be signed in to comment on a meetup" do
#   scenario "not signed in, so user gets a prompt to sign in" do
#     meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
#     user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
#     matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
#     visit '/meetup/1'
#
#     signed_in? == false
#     joined? == true
#     fill_in('Comment title', with: 'Might move')
#     fill_in('Comment body', with: 'I really have been thinking of moving to Neptune because of it!')
#     click_link('Submit')
#
#     expect(page).to have_content('You need to sign in if you want to do that!')
#     expect(current_path).to eq('/meetup/1')
#   end
#
#   scenario "not joined, so user gets a prompt to join" do
#     meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
#     user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
#     matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
#     visit '/meetup/1'
#
#     signed_in? == true
#     joined? == false
#     fill_in('Comment title', with: 'Might move')
#     fill_in('Comment body', with: 'I really have been thinking of moving to Neptune because of it!')
#     click_link('Submit')
#
#     expect(page).to have_content('You need to join the meetup in if you want to do that!')
#     expect(current_path).to eq('/meetup/1')
#   end
#
#
#   scenario "signed in and joined so successfully creates comment with title" do
#     meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
#     user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
#     matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
#     visit '/meetup/1'
#
#     signed_in? == true
#     joined? == true
#     fill_in('Comment title', with: 'Might move')
#     fill_in('Comment body', with: 'I really have been thinking of moving to Neptune because of it!')
#     click_link('Submit')
#
#     expect(page).to have_content('Comment added!')
#     expect(page).to have_content('Might move')
#     expect(page).to have_content('I really have been thinking of moving to Neptune because of it!')
#     expect(current_path).to eq('/meetup/1')
#   end
#
#   scenario "signed in and joined so successfully creates comment without title" do
#     meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
#     user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
#     matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
#     visit '/meetup/1'
#
#     signed_in? == true
#     joined? == true
#     fill_in('Comment body', with: 'I really have been thinking of moving to Neptune because of it!')
#     click_link('Submit')
#
#     expect(page).to have_content('Comment added!')
#     expect(page).to have_content('I really have been thinking of moving to Neptune because of it!')
#     expect(current_path).to eq('/meetup/1')
#   end
# end
#
# feature "User must enter text in a comment to submit" do
#   scenario "signed in and joined successfully, trying to creates comment without text" do
#     meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
#     user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
#     matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
#     visit '/meetup/1'
#
#     signed_in? == true
#     joined? == true
#     fill_in('Comment body', with: '')
#     click_link('Submit')
#
#     expect(page).to have_content('Need to add content to the comment body!')
#     expect(current_path).to eq('/meetup/1')
#   end
# end
#
# feature "Expect to see the comment on the meetup page" do
#   scenario "signed in and joined so successfully creates comment with title that shows on the meetup page" do
#     meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
#     user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
#     matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
#     visit '/meetup/1'
#
#     signed_in? == true
#     joined? == true
#     fill_in('Comment title', with: 'Might move')
#     fill_in('Comment body', with: 'I really have been thinking of moving to Neptune because of it!')
#     click_link('Submit')
#
#     expect(page).to have_content('Comment added!')
#
#     visit '/meetup/1'
#
#     expect(page).to have_content('Might move')
#     expect(page).to have_content('I really have been thinking of moving to Neptune because of it!')
#     expect(current_path).to eq('/meetup/1')
#   end
# end
#
# feature "Expect to see the comment most recently added at the top of comments on the meetup page" do
#   scenario "create a new comment on a meetup page where there is already a comment" do
#     meetup_1 = Meetup.create(name: "Urban Gardening", description: "Looking to chat about urban garden setups", location: "Boston, MA")
#     user_1 = User.create(provider: "GitHub", uid: "12345", username: "Joe Schmo", email: "jschmo@gmail.com", avatar_url: "http://www.angelicmonsters.com.au/wp-content/uploads/2013/11/angry-monster.jpg")
#     matchup_1 = Matchup.create(user_id: 1, meetup_id:1)
#     visit '/meetup/1'
#
#     signed_in? == true
#     joined? == true
#     fill_in('Comment title', with: 'Might move')
#     fill_in('Comment body', with: 'I really have been thinking of moving to Neptune because of it!')
#     click_link('Submit')
#
#     expect(page).to have_content('Comment added!')
#
#     visit '/meetup/1'
#
#     fill_in('Comment title', with: 'Cold at night')
#     fill_in('Comment body', with: 'My sleep problems arise from the cold, anyone know of a good heated blankey?')
#     click_link('Submit')
#
#     expect(page).to have_content('Comment added!')
#
#     visit '/meetup/1'
#
#     expect(page.find('li:nth-child(1)')).to have_content('Cold at night')
#     expect(page).to have_content('Might move')
#     expect(page).to have_content('I really have been thinking of moving to Neptune because of it!')
#     expect(current_path).to eq('/meetup/1')
#   end
# end
