class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.references :current
      t.references :follower

      t.timestamps

      # Rails 5+ only: add foreign keys
      add_foreign_key :private_messages, :users, column: :current_id, primary_key: :id
      add_foreign_key :private_messages, :users, column: :follower_id, primary_key: :id
    end
  end
end
