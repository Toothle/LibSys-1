require 'test_helper'

class BooksAddTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get addbook_path
    assert_no_difference 'Book.count' do
      post books_path, book: { ISBN: "",
                               author: "a",
                               title: "b",
                               descrpition: "c",
                               status: "d"}
    end
    assert_template 'books/new'
  end

  test "valid add book information" do
    get addbook_path

    ISBN = "ISBN"
    author = "author"
    title = "title"
    description = "description"
    status = "status"

    assert_difference 'Book.count', 1 do
      post_via_redirect books_path, book: { ISBN: ISBN,
                                            author: author,
                                            title: title,
                                            description: description,
                                            status: status}
    end
    assert_template 'books/show'
  end

end
