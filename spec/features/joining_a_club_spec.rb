require "rails_helper"

feature "Joining a club" do
  scenario "while signed in" do
    club = FactoryGirl.create(:club)
    sign_in
    visit club_path(club)
    click_on "Join this Book Club"

    expect(page).to have_content "Organizer: Tom Brady"
    expect(page).to have_content "You have joined #{club.name}"
    expect(page).to have_content "Paul Pierce"
    expect(page).not_to have_css "input#join-club"
  end
end
