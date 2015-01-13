class AddAmazonToBooks < ActiveRecord::Migration
  def change
    add_column :books, :amazon_url, :string
    add_column :books, :small_image, :string
    add_column :books, :medium_image, :string
  end
end
