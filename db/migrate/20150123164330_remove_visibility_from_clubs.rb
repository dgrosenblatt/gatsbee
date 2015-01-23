class RemoveVisibilityFromClubs < ActiveRecord::Migration
  def change
    remove_column :clubs, :visibility, :string
  end
end
