require "rails_helper"

feature "Joining a club" do
  scenario "while signed in" do
    club = FactoryGirl.create(:club)
    user = FactoryGirl.create(:user)
    log_in(user)
    visit club_path(club)
    click_on "Join this Book Club"

    expect(page).to have_content club.organizer.name
    expect(page).to have_content user.name
    expect(page).to have_content "You have joined #{club.name}"
    expect(page).not_to have_css "input#join-club"
  end
end
