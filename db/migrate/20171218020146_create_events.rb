class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.text :about
      t.string :short_description
      t.date :date_event
      t.time :time_event

      t.timestamps
    end
  end
end
