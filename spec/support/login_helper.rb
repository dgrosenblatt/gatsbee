def sign_in
  set_omniauth
  visit "/"
  click_link "Sign in"
end

def create_club
  club = FactoryGirl.build(:club)
  click_link "Clubs"
  click_link "Create New Book Club"
  fill_in "Name", with: club.name
  fill_in "Description", with: club.description
  select "Public", from: "Visibility"
  click_button "Create Club"
end
