class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_commentscounter
  before_destroy :decrement_commentscounter
  def increment_commentscounter
    user.increment!(:commentscounter)
  end

  def decrement_commentscounter
    user.decrement!(:commentscounter)
  end
end
