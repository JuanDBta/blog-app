class Like < ApplicationRecord
    belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_likescounter
  before_destroy :decrement_likescounter
  def increment_likescounter
    post.increment!(:likescounter)
  end

  def decrement_likescounter
    post.decrement!(:likescounter)
  end
end
