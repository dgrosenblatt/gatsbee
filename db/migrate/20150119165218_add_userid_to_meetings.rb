class AddUseridToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :user_id, :integer, null: false
  end
end
