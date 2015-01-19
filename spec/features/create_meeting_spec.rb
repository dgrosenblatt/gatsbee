require "rails_helper"

feature "Creating a new meeting" do
  scenario "with valid data" do
    club = FactoryGirl.create(:club)
    user = FactoryGirl.create(:user)
    Membership.create(user_id: user.id, club_id: club.id)
    log_in(user)
    visit club_path(club)
    fill_in "When?", with: "Tomorrow at 7 pm"
    fill_in "Where?", with: "My House"
    click_button "Create Meeting"

    expect(page).to have_content "New Meeting Created!"
    expect(page).to have_content "Tomrorrow at 7 pm"
  end

  scenario "with invalid data" do
    club = FactoryGirl.create(:club)
    user = FactoryGirl.create(:user)
    Membership.create(user_id: user.id, club_id: club.id)
    log_in(user)
    visit club_path(club)
    fill_in "When?", with: "blerg"
    click_button "Create Meeting"

    expect(page).to have_content "Meeting time couldn't be understood."
    expect(page).to have_content "Location can't be blank"
  end
end
