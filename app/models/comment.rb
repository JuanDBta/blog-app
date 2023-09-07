class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_commentscounter
  before_destroy :decrement_commentscounter

  private
  
  def increment_commentscounter
    author.increment!(:commentscounter)
  end

  def decrement_commentscounter
    author.decrement!(:commentscounter)
  end
end
