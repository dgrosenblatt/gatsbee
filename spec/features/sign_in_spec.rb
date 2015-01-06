require "rails_helper"

feature "Signing in with google" do
  scenario "from the home page" do
    @user = FactoryGirl.create(:user)
    set_omniauth
    visit "/"
    click_link "Sign in"

    expect(page).to have_content "Sign Out"
    expect(page).to have_content "Profile"
    expect(page).to have_content "Clubs"
    expect(page).to have_content @user.name
    expect(page).to have_content "You have signed in to GatsBee"

    expect(page).not_to have_link "Sign in"
  end

end
