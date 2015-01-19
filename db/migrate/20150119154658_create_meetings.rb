class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :location, null: false
      t.string :meeting_time, null: false
      t.integer :club_id, null: false

      t.timestamps null: false
    end
  end
end
