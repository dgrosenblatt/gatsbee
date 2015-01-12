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

  scenario "after joining clubs and making comments" do
    sign_in
    organize_club
    fill_in "comment-content", with: "This is a good book so far."
    click_button "Create Comment"
    click_link "Profile"

    expect(page).to have_content "Awesome Book Club"
    expect(page).to have_content "This is a good book so far."
  end
end
