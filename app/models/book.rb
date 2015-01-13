class Book < ActiveRecord::Base
  has_many :comments
  has_many :clubs, class_name: "Club", foreign_key: "current_book_id"
end
