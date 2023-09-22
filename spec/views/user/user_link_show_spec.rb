require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  describe 'show page' do
    let!(:user) do
      User.create(name: 'Alex', photo: 'alex.jpg', bio: 'Physicist', posts_counter: 3)
    end
    let!(:post) do
      Post.create(author: user, title: 'Test1', text: 'First post',
                  commentscounter: 0, likescounter: 0)
    end
    let!(:post2) do
      Post.create(author: user, title: 'Test2', text: 'Second post',
                  commentscounter: 0, likescounter: 0)
    end
    let!(:post3) do
      Post.create(author: user, title: 'Test3', text: 'Third post',
                  commentscounter: 0, likescounter: 0)
    end

    before do
      visit user_path(user)
    end
    it 'displays the button to see all posts' do
      expect(page).to have_link('See All Posts')
    end

    it 'redirects to the post show page when a user post is clicked' do
      click_link(post2.text, match: :first)

      expect(page).to have_current_path(user_posts_path(user))
    end

    it 'redirects to the post index page when see all post link is clicked' do
      click_link('See All Posts')

      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
