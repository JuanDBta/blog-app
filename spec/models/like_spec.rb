require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John', photo: 'photo.url', bio: 'his bio', posts_counter: 0) }
  let(:post) do
    Post.create(author: user, title: 'Test Post', text: 'This is a test post', commentscounter: 0, likescounter: 0)
  end

  it 'is valid with valid attributes' do
    like = Like.new(user:, post:)
    expect(like).to be_valid
  end

  it 'is not valid without a user' do
    like = Like.new(post:)
    expect(like).not_to be_valid
  end

  it 'is not valid without a post' do
    like = Like.new(user:)
    expect(like).not_to be_valid
  end

  it 'increments the post\'s likes counter after save' do
    expect do
      Like.create(user:, post:)
    end.to change { post.reload.likescounter }.by(1)
  end

  it 'decrements the post\'s likes counter before destroy' do
    like = Like.create(user:, post:)

    expect do
      like.destroy
    end.to change { post.reload.likescounter }.by(-1)
  end
end
