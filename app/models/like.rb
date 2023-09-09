class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :increment_likescounter
  before_destroy :decrement_likescounter

  private
  
  def increment_likescounter
    post.increment!(:likescounter)
  end

  def decrement_likescounter
    post.decrement!(:likescounter)
  end
end
