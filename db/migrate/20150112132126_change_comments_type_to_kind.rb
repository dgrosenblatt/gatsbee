class ChangeCommentsTypeToKind < ActiveRecord::Migration
  def up
    add_column :comments, :kind, :string
    remove_column :comments, :type, :string
  end
  def down
    add_column :comments, :type, :string
    remove_column :comments, :kind, :string
  end
end
