class Club < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :comments
  belongs_to :organizer, class_name: "User"

  validates :name,
    presence: true,
    length: { minimum: 3, maximum: 70 },
    uniqueness: true

  validates :description,
    length: { maximum: 140 }

  validates :visibility,
    presence: true

  validates :organizer_id,
    presence: true

  def self.search(query)
    where("plainto_tsquery(?) @@ " +
          "to_tsvector('english', name || ' ' || description)",
          query)
  end
end
