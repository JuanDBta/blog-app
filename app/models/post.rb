class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likescounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :increment_posts_counter
  before_destroy :decrement_posts_counter

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
end
