require 'rails_helper'

feature "View all clubs" do
  scenario "on the clubs index page" do
    FactoryGirl.create_list(:club, 10)
    visit "/clubs"

    expect(page).to have_content "Find a Book Club"
    expect(page).to have_content "Book Club"
  end
end
