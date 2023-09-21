require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  let!(:user) { User.create(name: 'Juan', photo: 'juan.jpg', posts_counter: 3) }
  let!(:post) do
    user.posts.create(
      author: user,
      title: 'Test Post',
      text: 'Hello'
    )
  end
  let!(:lily) do
    User.create(name: 'lily', photo: 'l.jpg', bio: 'teacher from mexico', posts_counter: 0)
  end
  let!(:comment1) do
    Comment.create(user: lily, post: post, text: 'First post!')
  end
  let!(:comment2) do
    Comment.create(user: lily, post: post, text: 'Second post!')
  end
  let!(:comment3) do
    Comment.create(user: lily, post: post, text: 'Third post!')
  end

  before do
    visit user_post_path(user, post)
  end

  it 'I can see the post text.' do
    expect(page).to have_content(post.text)
  end
  it 'I can see who wrote the post.' do
    expect(page).to have_content(user.name)
  end
  it 'displays how many comments and likes a post has' do
    post = Post.create(author: user, commentscounter: 3, likescounter: 0)
    visit user_posts_path(user)
    expect(page).to have_content("Comments: #{post.commentscounter}")
    expect(page).to have_content("Likes: #{post.likescounter}")
end
  it 'displays some of the post body' do
    expect(page).to have_selector('p', text: 'Hello')
  end
  it 'I can see the username of each commentator' do
    expect(page).to have_content(comment1.user.name)
    expect(page).to have_content(comment2.user.name)
    expect(page).to have_content(comment3.user.name)
  end
  it 'I can see the comment each commentator left.' do
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
    expect(page).to have_content(comment3.text)
  end
end
