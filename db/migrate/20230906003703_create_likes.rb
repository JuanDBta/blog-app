class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user_id, null: false, foreign_key: true, index: true
      t.references :post_id, null: false, foreign_key: true, index: true
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end
  end
end
