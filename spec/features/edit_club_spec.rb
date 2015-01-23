require "rails_helper"

feature "Editing a club" do
  scenario "as the club's organizer" do
    club = FactoryGirl.create(:club)
    organizer = club.organizer
    log_in(organizer)
    visit club_path(club)
    click_link "Settings"
    fill_in "Name", with: "blerg"
    fill_in "Description", with: "lemon"
    fill_in "Currently Reading (You can pick this later)", with: "Infinite Jest"
    click_button "Save Club"

    expect(page).to have_content "Book Club Updated!"
    expect(page).to have_content "lemon"
    expect(page).to have_content "blerg"
    expect(page).to have_content "Infinite Jest"
  end
end
