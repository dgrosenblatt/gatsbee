require "rails_helper"

feature "Deleting a club" do
  scenario "as the club's organizer" do
    sign_in
    create_club
    click_link "Settings"
    click_link "Delete This Club"

    expect(page).to have_content "Club Deleted!"
    expect(page).to have_content "All Clubs"
    expect(page).not_to have_content "A book club for all the cool programmers"
  end

  scenario "as a regular club member"
  scenario "without signing in"
end
