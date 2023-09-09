require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John', photo: 'photo.url', bio: 'his bio', posts_counter: 0) }

  it 'is valid with valid attributes' do
    post = Post.new(author: user, title: 'Valid Post', text: 'This is a valid post', commentscounter: 0,
                    likescounter: 0)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(author: user, text: 'This post has no title', commentscounter: 0, likescounter: 0)
    expect(post).not_to be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    post = Post.new(author: user, title: 'A' * 251, text: 'This post has a very long title', commentscounter: 0,
                    likescounter: 0)
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments counter' do
    post = Post.new(author: user, title: 'Negative Comments', text: 'This post has a negative comments counter',
                    commentscounter: -1, likescounter: 0)
    expect(post).not_to be_valid
  end

  it 'is not valid with a non-integer comments counter' do
    post = Post.new(author: user, title: 'Non-Integer Comments', text: 'This post has a non-integer comments counter',
                    commentscounter: 'not_an_integer', likescounter: 0)
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes counter' do
    post = Post.new(author: user, title: 'Negative Likes', text: 'This post has a negative likes counter',
                    commentscounter: 0, likescounter: -1)
    expect(post).not_to be_valid
  end

  it 'is not valid with a non-integer likes counter' do
    post = Post.new(author: user, title: 'Non-Integer Likes', text: 'This post has a non-integer likes counter',
                    commentscounter: 0, likescounter: 'not_an_integer')
    expect(post).not_to be_valid
  end

  it 'returns the most recent comments' do
    post = Post.create(author: user, title: 'Recent Comments Post', text: 'This post has recent comments',
                       commentscounter: 0, likescounter: 0)
    comment1 = Comment.create(user:, post:, text: 'Comment 1', created_at: 1.day.ago)
    comment2 = Comment.create(user:, post:, text: 'Comment 2', created_at: 2.days.ago)
    comment3 = Comment.create(user:, post:, text: 'Comment 3', created_at: 3.days.ago)
    comment4 = Comment.create(user:, post:, text: 'Comment 4', created_at: 4.days.ago)
    comment5 = Comment.create(user:, post:, text: 'Comment 5', created_at: 5.days.ago)
    Comment.create(user:, post:, text: 'Comment 6', created_at: 6.days.ago)

    recent_comments = post.recent_comments

    expect(recent_comments).to eq([comment1, comment2, comment3, comment4, comment5])
  end

  it 'increments the author\'s posts counter after save' do
    expect do
      Post.create(author: user, title: 'New Post', text: 'This is a new post', commentscounter: 0,
                  likescounter: 0)
    end.to change { user.reload.posts_counter }.by(1)
  end

  it 'decrements the author\'s posts counter before destroy' do
    post = Post.create(author: user, title: 'Post to be Destroyed', text: 'This post will be destroyed',
                       commentscounter: 0, likescounter: 0)

    expect do
      post.destroy
    end.to change { user.reload.posts_counter }.by(-1)
  end
end
