require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John', photo: 'photo.url', bio: 'his bio', posts_counter: 0) }
  let(:post) do
    Post.create(author: user, title: 'Test Post', text: 'This is a test post', commentscounter: 0, likescounter: 0)
  end

  it 'is valid with valid attributes' do
    comment = Comment.new(user:, post:, text: 'This is a valid comment')
    expect(comment).to be_valid
  end

  it 'is not valid without a user' do
    comment = Comment.new(post:, text: 'This comment has no user')
    expect(comment).not_to be_valid
  end

  it 'is not valid without a post' do
    comment = Comment.new(user:, text: 'This comment has no post')
    expect(comment).not_to be_valid
  end

  it 'increments the post\'s comments counter after save' do
    expect do
      Comment.create(user:, post:, text: 'New Comment')
    end.to change { post.reload.commentscounter }.by(1)
  end

  it 'decrements the post\'s comments counter before destroy' do
    comment = Comment.create(user:, post:, text: 'Comment to be Destroyed')

    expect do
      comment.destroy
    end.to change { post.reload.commentscounter }.by(-1)
  end
end
