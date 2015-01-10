require "rails_helper"

feature "Leaving a club" do
  scenario "after joining it" do
    club = FactoryGirl.create(:club)
    sign_in
    visit club_path(club)
    click_on "Join this Book Club"
    click_on "Leave this Book Club"

    expect(page).to have_content "You have left #{club.name}"
    expect(page).to have_content "All Clubs"
  end

  scenario "before joining it" do
    club = FactoryGirl.create(:club)
    sign_in
    visit club_path(club)

    expect(page).not_to have_content "Leave this Book Club"
  end

  scenario "as the organizer" do
    sign_in
    organize_club
    expect(page).not_to have_content "Leave this Book Club"
  end
end
