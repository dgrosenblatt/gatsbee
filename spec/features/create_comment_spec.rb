require "rails_helper"

feature "Create a comment in a club" do
  let(:club) { FactoryGirl.create(:club) }

  before do
    sign_in
    visit club_path(club)
  end

  scenario "as a member of the club with valid content" do
    click_button "Join this Book Club"
    fill_in "comment-content", with: "This is a good book so far."
    click_button "Create Comment"

    expect(page).to have_content "Comment Saved"
    expect(page).to have_content "This is a good book so far."
  end

  scenario "without valid content" do
    click_button "Join this Book Club"
    click_button "Create Comment"

    expect(page).to have_content "Content can't be blank"
  end

  scenario "without joining the group" do
    expect(page).not_to have_css("textarea#comment-content")
  end
end
