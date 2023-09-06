class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author_id, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
      t.integer :comments_counter
      t.integer :likes_counter
    end
  end
end
