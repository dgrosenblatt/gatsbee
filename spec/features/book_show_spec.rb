require "rails_helper"

feature "view a book's discussion questions and popularity" do
  scenario "from the book's show page" do
    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment, kind: "question")
    book = comment.book
    club = comment.club
    club.update_attributes(current_book_id: book.id)
    visit book_path(book)

    expect(page).to have_content book.title
    expect(page).to have_content "Currently 1 club reading this book"
    expect(page).to have_content comment.content
  end
end
