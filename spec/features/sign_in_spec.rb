require "rails_helper"

feature "Signing in with google" do
  scenario "from the home page" do
    set_omniauth
    visit "/"
    click_link "Sign in"

    expect(page).to have_content "Sign Out"
    expect(page).to have_content "Profile"
    expect(page).to have_content "Clubs"
    expect(page).not_to have_link "Sign in"

  end
end
