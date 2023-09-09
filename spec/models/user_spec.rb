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
end
