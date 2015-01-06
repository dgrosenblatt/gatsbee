class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.string :description
      t.integer :current_book_id
      t.string :visibility, null: false, default: "public"
      t.integer :organizer_id, null: false

      t.timestamps null: false
    end

    create_table :memberships do |t|
      t.integer :user_id
      t.integer :club_id

      t.timestamps
    end
  end
end
