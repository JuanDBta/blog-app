require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  let!(:user1) { User.create(name: 'Juan', photo: 'juan.jpg', posts_counter: 1) }
  let!(:user2) { User.create(name: 'David', photo: 'david.jpg', posts_counter: 1) }

  before do
    visit users_path
  end

  it 'it should display usernames' do
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'it show the post counter of each user' do
    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    expect(page).to have_content("Number of posts: #{user2.posts_counter}")
  end

  it 'it show the profile picture of the user' do
    expect(page).to have_css("img[src*='juan.jpg']")
    expect(page).to have_css("img[src*='david.jpg']")
  end

  it 'provides links to user show pages ' do
    click_link(user1.name)
    expect(page).to have_current_path(user_path(user1))
  end
  it 'provides links to user show pages ' do
    click_link(user2.name)
    expect(page).to have_current_path(user_path(user2))
  end
end