class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text
  has_many :comments
  belongs_to :author, foreign_key: :author_id
end
