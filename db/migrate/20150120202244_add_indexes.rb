class AddIndexes < ActiveRecord::Migration
  def change
    add_index :clubs, :organizer_id
    add_index :clubs, :current_book_id
    add_index :comments, :user_id
    add_index :comments, :club_id
    add_index :comments, :book_id
    add_index :meetings, :club_id
    add_index :meetings, :user_id
    add_index :memberships, :user_id
    add_index :memberships, :club_id
  end
end
