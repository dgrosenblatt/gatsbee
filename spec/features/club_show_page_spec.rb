require "rails_helper"

feature "Viewing a public club's page" do
  scenario "while signed in" do
    organizer = FactoryGirl.create(:user)
    club = FactoryGirl.create(:club, organizer_id: organizer.id)
    user = FactoryGirl.create(:user)
    log_in(user)
    visit club_path(club)

    expect(page).to have_content "Book Club"
    expect(page).to have_content "A book club for all the cool programmers"
  end

  scenario "without signing in" do
    club = FactoryGirl.create(:club)
    visit club_path(club)

    expect(page).to have_content "Please sign in with Google to continue"
    expect(page).not_to have_content "Book Club"
    expect(page).not_to have_content "A book club for all the cool programmers"
  end
end

feature "viewing the current book discussion questions" do
  scenario "from the show page"
end
