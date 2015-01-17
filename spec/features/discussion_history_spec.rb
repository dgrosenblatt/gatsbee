require "rails_helper"

feature "viewing a club's discussion history" do
  scenario "as a member of the club" do
    comments = FactoryGirl.create_list(:comment, 10)
    club = comments.first.club
    user = FactoryGirl.create(:user)
    Membership.create(user_id: user.id, club_id: club.id)
    log_in(user)
    visit club_comments_path(club)

    expect(page).to have_content comments.first.content
  end
end
