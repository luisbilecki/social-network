class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.integer :current
      t.integer :follower

      t.timestamps

      # Rails 5+ only: add foreign keys
      add_foreign_key :current, :users, column: :current_id, primary_key: :id
      add_index :current, :current_id
      add_foreign_key :follower, :users, column: :follower_id, primary_key: :id
      add_index :follower, :follower_id
    end
  end
end
