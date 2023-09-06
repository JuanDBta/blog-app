class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_commentscounter
  before_destroy :decrement_commentscounter
  def increment_commentscounter
    user.increment!(:commentscounter)
  end

  def decrement_commentscounter
    user.decrement!(:commentscounter)
  end
end
