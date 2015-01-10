require "rails_helper"

feature "Editing a club" do
  scenario "as the club's organizer" do
    sign_in
    create_club
    click_link "Settings"
    fill_in "Name", with: "blerg"
    fill_in "Description", with: "lemon"
    click_button "Update Club"

    expect(page).to have_content "Book Club Updated!"
    expect(page).to have_content "lemon"
    expect(page).to have_content "blerg"
  end

  scenario "as a regular club member"

  scenario "without signing in"
end
