FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    uid "1234567890"
    name "Tom Brady"
    email "tb12@pats.org"
    oauth_token "1234567890abcdefg"
    oauth_expires_at Time.new(2016, 02, 24, 12, 0, 0, "+09:00")
    role "member"
  end

  factory :organizer, class: User do
    provider "google_oauth2"
    uid "8327810"
    name "Bill Belichick"
    email "bb@pats.org"
    oauth_token "239ffbi1ifi2"
    oauth_expires_at Time.new(2016, 02, 24, 12, 0, 0, "+09:00")
  end

  factory :club do
    sequence(:name) { |n| "Awesome Book Club #{n}" }
    description "A book club for all the cool programmers"
    organizer
    association :current_book, factory: :book
  end

  factory :comment do
    content "I like what I'm reading so far."
    kind "remark"
    club
    user
    book
  end

  factory :book do
    title "A Tale of Two Cities"
  end
end
