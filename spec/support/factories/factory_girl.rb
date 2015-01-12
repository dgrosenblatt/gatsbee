FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    uid "1234567890"
    name "Tom Brady"
    email "tb12@pats.org"
    oauth_token "1234567890abcdefg"
    oauth_expires_at Time.new(2016, 02, 24, 12, 0, 0, "+09:00")
    role "member"
    favorite_authors "Charles Dickens, Jonathan Franzen"
    favorite_books "Harry Potter, Lord of the Rings"
  end

  factory :club do
    sequence(:name) { |n| "Awesome Book Club #{n}" }
    description "A book club for all the cool programmers"
    current_book_id 1
    visibility "public"
    association :organizer, factory: :user
  end

  factory :comment do
    content "I like what I'm reading so far."
    kind "remark"
    club
    user
  end
end
