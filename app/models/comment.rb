class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :increment_commentscounter
  before_destroy :decrement_commentscounter

  private

  def increment_commentscounter
    post.increment!(:commentscounter)
  end

  def decrement_commentscounter
    post.decrement!(:commentscounter)
  end
end
