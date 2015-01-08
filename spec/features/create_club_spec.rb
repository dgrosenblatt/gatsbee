require "rails_helper"

feature "Creating a new book club" do
  scenario "as a signed in user" do
    club = FactoryGirl.build(:club)
    user = FactoryGirl.create(:user)
    sign_in
    visit new_club_path
    fill_in "Book Club Name", with: club.name
    fill_in "Description", with: club.description
    select "Public", from: "Visibility"
    click_button "Create Club"

    expect(page).to have_content "New Club Created!"
    expect(page).to have_content club.name
  end

  scenario "without required information" do
    club = FactoryGirl.build(:club)
    user = FactoryGirl.create(:user)
    sign_in
    visit new_club_path
    click_button "Create Club"

    expect(page).to have_content "Name can't be blank"
    expect(page).not_to have_content "New Club Created!"
  end

  scenario "without signing in" do
    visit clubs_path

    expect(page).not_to have_link "Create New Book Club"
  end
end
