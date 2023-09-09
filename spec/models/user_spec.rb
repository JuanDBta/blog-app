require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'alex', photo: 'photo.url', bio: 'his bio', posts_counter: 0) }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'post counter should be greater than 0' do
    subject.posts_counter = -1
    expect(subject).not_to be_valid
  end

  it 'post counter should be valid numericality' do
    subject.posts_counter = 'not_an_integer'
    expect(subject).not_to be_valid
  end

  describe 'associations' do
    it 'has many comments' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq("user_id")
    end

    it 'has many posts' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq("author_id")
    end

    it 'has many likes' do
      association = described_class.reflect_on_association(:likes)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq("user_id")
    end
  end

  describe User, type: :model do
    describe '#recent_posts' do
      it 'returns the most recent posts for the user' do
        user = User.create(name: 'Charlie', photo: 'photo.spec', bio: 'in a test')
        user.save
        user.id = 1
    
        post1 = Post.create(author_id: user.id, title: 'First Post', text: 'This is the first post', commentscounter: 0, likescounter: 0)
        post1.save
        post2 = Post.create(author_id: user.id, title: 'Second Post', text: 'This is the second post', commentscounter: 0, likescounter: 0)
        post2.save
        post3 = Post.create(author_id: user.id, title: 'Third Post', text: 'This is the third post', commentscounter: 0, likescounter: 0)
        post3.save

        recent_posts = user.recent_posts
  
        # Ordena los posts en orden descendente de acuerdo a la fecha de creación
        expected_posts = [post3, post2, post1]
  
        expect(recent_posts).to eq(expected_posts)
        end
    end
  end
end
