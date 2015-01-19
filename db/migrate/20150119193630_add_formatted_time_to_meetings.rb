class AddFormattedTimeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :formatted_time, :datetime
  end
end
