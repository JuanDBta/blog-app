class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :post, foreign_key: :post_id
end
