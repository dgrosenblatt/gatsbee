require "rails_helper"

feature "Creating a new meeting" do
  scenario "with valid data as a logged in club member" do
    club = FactoryGirl.create(:club)
    user = FactoryGirl.create(:user)
    Membership.create(user_id: user.id, club_id: club.id)
    log_in(user)
    visit club_path(club)
    fill_in "When?", with: "Tomorrow at 7 pm"
    fill_in "Where?", with: "My House"
    click_button "Create Meeting"

    expect(page).to have_content "New Meeting Created!"
  end
end
