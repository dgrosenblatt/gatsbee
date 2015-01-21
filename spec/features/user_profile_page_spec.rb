require "rails_helper"

feature "User views profile page" do

  scenario "without signing up or signing in" do
    visit "/profile"

    expect(page).to have_content "Please sign in with Google to continue"
  end

  scenario "after joining clubs and making comments" do
    user = FactoryGirl.create(:user)
    club = FactoryGirl.create(:club)
    Membership.create(user_id: user.id, club_id: club.id)
    log_in(user)
    click_link "Profile"

    expect(page).to have_content "Awesome Book Club"
  end
end
