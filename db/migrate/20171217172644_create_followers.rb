class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.integer :current_id
      t.integer :follower_id

      t.timestamps
    end

      add_foreign_key :followers, :users, column: :current_id
      add_index :followers, :current_id
      add_foreign_key :followers, :users, column: :follower_id
      add_index :followers, :follower_id
  end
end
