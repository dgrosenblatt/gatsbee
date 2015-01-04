FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    uid "1234567890"
    name "Tom Brady"
    email "tb12@pats.org"
    oauth_token "1234567890abcdefg"
    oauth_expires_at "2016-01-03 23:03:47"
    role "member"
    favorite_authors "Charles Dickens, Jonathan Franzen"
    favorite_books "Harry Potter, Lord of the Rings"
  end
end
