require 'test_helper'

class BooksAddTest < ActionDispatch::IntegrationTest
  # test "invalid signup information" do
  #   get signup_path
  #   assert_no_difference 'User.count' do
  #     post users_path, user: { name: "",
  #                              email: "user@invalid",
  #                              password: "foo",
  #                              password_confirmation: "bar" }
  #   end
  #   assert_template 'users/new'
  # end

  test "valid add book information" do
    get addbook_path

    ISBN = "ISBN"
    author = "author"
    title = "title"
    description = "description"
    status = "status"

    assert_difference 'Book.count', 1 do
      post_via_redirect books_path, user: { ISBN: ISBN,
                                            author: author,
                                            title: title,
                                            description: description,
                                            status: status}
    end
    assert_template 'books/show'
  end

end
