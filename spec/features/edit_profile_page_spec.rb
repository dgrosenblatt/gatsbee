require "rails_helper"

feature "Edit user profile" do
  scenario "while signed in" do
    sign_in
    click_link "Profile"
    fill_in "Add Book", with: "The Corrections"
    click_button "Update Profile"

    expect(page).to have_content "The Corrections"
    expect(page).to have_content "Profile Updated"
  end
end
