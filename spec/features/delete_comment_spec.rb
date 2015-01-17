require "rails_helper"

feature "Delete a comment" do
  before do
    user = FactoryGirl.create(:user)
    log_in(user)
  end

  scenario "as the user who created it" do
    club = FactoryGirl.create(:club)
    visit club_path(club)
    click_button "Join this Book Club"
    fill_in "comment-content", with: "This is a good book so far."
    click_button "Create Comment"
    click_link "delete-comment"

    expect(page).to have_content "Comment Deleted"
  end

  scenario "as a different club member" do
    comment = FactoryGirl.create(:comment)
    club = comment.club
    comment.update_attributes(book_id: club.current_book.id)
    visit club_path(club)
    click_button "Join this Book Club"

    expect(page).to have_content comment.content
    expect(page).not_to have_css("#delete-comment")
  end

  scenario "without joining the club" do
    comment = FactoryGirl.create(:comment)
    club = comment.club
    comment.update_attributes(book_id: club.current_book.id)
    visit club_path(club)

    expect(page).to have_content comment.content
    expect(page).not_to have_css("#delete-comment")
  end
end
