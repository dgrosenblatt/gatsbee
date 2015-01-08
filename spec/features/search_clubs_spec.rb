require 'rails_helper'

feature "Search clubs" do
  scenario "from the index page" do
    boston = FactoryGirl.create(:club, name: "Boston book club")
    ruby = FactoryGirl.create(:club, name: "Reading Ruby Programmers")
    visit clubs_path
    fill_in "Search Book Clubs", with: "Boston"
    click_button "Search"

    expect(page).to have_content "Results for 'Boston'"
    expect(page).to have_content "Boston book club"
    expect(page).not_to have_content "Reading Ruby Programmers"
  end
end
