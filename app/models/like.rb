class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    after_create :increment_likescounter
  before_destroy :decrement_likescounter
  def increment_posts_counter
    user.increment!(:likescounter)
  end

  def decrement_posts_counter
    user.decrement!(:likescounter)
  end
end
