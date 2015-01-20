class AddAmazonItemidToBooks < ActiveRecord::Migration
  def change
    add_column :books, :amazon_itemid, :string
  end
end
