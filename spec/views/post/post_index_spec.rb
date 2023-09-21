require 'rails_helper'

RSpec.feature 'Post index page', type: :feature do
  describe 'index page' do
    let!(:user) do
      User.create(name: 'Alex', photo: 'alex.jpg', bio: 'Physicist', posts_counter: 5)
    end

    let!(:lily) do
      User.create(name: 'lily', photo: 'l.jpg', bio: 'teacher from mexico', posts_counter: 0)
    end

    let!(:post) do
      Post.create(author: user, title: 'Post title', text: 'Post text')
    end

    let!(:comment) do
      Comment.create(user_id: lily.id, post_id: post.id, text: 'Great post!')
    end

    before do
      visit user_posts_path(user)
    end
    it ' can see the user profile picture.' do
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
    it 'I can see the user username.' do
      expect(page).to have_content(user.name)
    end
    it 'show the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end

    it 'I can see a post text.' do
      expect(page).to have_content(post.text)
    end
    it 'I can see the first comments on a post.' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
    it 'displays how many comments and likes a post has' do
        post = Post.create(author: user, commentscounter: 1, likescounter: 0)
        visit user_posts_path(user)
        expect(page).to have_content("Comments: #{post.commentscounter}")
        expect(page).to have_content("Likes: #{post.likescounter}")
    end
    it 'displays a section for pagination' do
        expect(page).to have_button('Pagination')
    end
    it 'When I click on a post, it redirects me to that post show page.' do
      click_link(post.text)
      expect(current_path).to eq(user_post_path(user, post))
    end
  end
end