require "rails_helper"

feature "Deleting a club" do
  scenario "as the club's organizer" do
    club = FactoryGirl.create(:club)
    organizer = club.organizer
    log_in(organizer)
    visit club_path(club)
    click_link "Settings"
    click_link "Delete This Club"

    expect(page).to have_content "Club Deleted!"
    expect(page).to have_content "Find a Book Club"
    expect(page).not_to have_content "A book club for all the cool programmers"
  end

  scenario "as a regular club member" do
    user = FactoryGirl.create(:user)
    club = FactoryGirl.create(:club)
    Membership.create(user_id: user.id, club_id: club.id)
    log_in(user)
    visit club_path(club)

    expect(page).not_to have_content "Settings"
  end
end
