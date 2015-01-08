class Club < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: "memberships"
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
