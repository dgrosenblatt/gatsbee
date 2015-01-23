class RemoveFavoritesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_books, :string
    remove_column :users, :favorite_authors, :string
  end
end
