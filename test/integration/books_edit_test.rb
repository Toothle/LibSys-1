require 'test_helper'

class BooksEditTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:hma)
  end

  test "unsuccessful edit" do
    get edit_book_path(@book)
    patch book_path(@book), book: { ISBN: "",
                                    author: "a",
                                    title: "b",
                                    descrpition: "c",
                                    status: "d"}
    assert_template 'books/edit'
  end

  test "successful edit" do
    get edit_book_path(@book)
    ISBN = "abc"
    patch book_path(@book), book: { ISBN: ISBN,
                                    author: "a",
                                    title: "b",
                                    descrpition: "c",
                                    status: "d"}
    assert_not flash.empty?
    assert_redirected_to @book
    @book.reload
    assert_equal @book.ISBN, ISBN
  end

end
