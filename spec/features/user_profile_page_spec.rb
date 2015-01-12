require "rails_helper"

feature "User views profile page" do

  scenario "without signing in" do
    visit "/profile"

    expect(page).to have_content "Please sign in with Google to continue"
  end

  scenario "after signing in" do
    sign_in
    click_link "Profile"

    expect(page).to have_content "Profile"
    expect(page).to have_content "Recent Comments"
    expect(page).to have_content "Favorite Books"
    expect(page).to have_content "Favorite Authors"
    expect(page).to have_content "Paul Pierce"
  end

  scenario "after joining clubs and making comments"

end
