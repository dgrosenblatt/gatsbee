class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @similar_books = AmazonApi.similarity_lookup(@book.amazon_itemid)
  end
end
