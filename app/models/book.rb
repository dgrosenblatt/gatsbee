class Book < ActiveRecord::Base
  has_many :comments
  has_many :clubs, class_name: "Club", foreign_key: "current_book_id"

  validates :title,
    presence: true

  scope :top_five, -> do
    select("books.id, books.title, books.medium_image, count(clubs.id) AS clubs_count").
    joins(:clubs).
    group("books.id").
    order("clubs_count DESC").
    limit(5)
  end
  
  def default_title
    title || 'Book Title'
  end
end
