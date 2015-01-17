require "rails_helper"

feature "Leaving a club" do
  before { @club = FactoryGirl.create(:club) }

  scenario "after joining it" do
    user = FactoryGirl.create(:user)
    Membership.create(user_id: user.id, club_id: @club.id)
    log_in(user)
    visit club_path(@club)
    click_on "Leave this Book Club"

    expect(page).to have_content "You have left #{@club.name}"
    expect(page).to have_content "All Clubs"
  end

  scenario "before joining it" do
    user = FactoryGirl.create(:user)
    log_in(user)
    visit club_path(@club)

    expect(page).not_to have_content "Leave this Book Club"
  end

  scenario "as the organizer" do
    log_in(@club.organizer)
    visit club_path(@club)

    expect(page).not_to have_content "Leave this Book Club"
  end
end
