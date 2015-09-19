require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @book = Book.new(ISBN: "sample ISBN", title: "sample title", description: "sample des", author: "sample author", status: "status")
  end

  # PRESENCE

  test "should be valid" do
    assert @book.valid?
  end

  test "ISBN should be present" do
    @book.ISBN = " "
    assert_not @book.valid?
  end

  test "title should be present" do
    @book.title = " "
    assert_not @book.valid?
  end

  test "author should be present" do
    @book.author = " "
    assert_not @book.valid?
  end

  test "status should be present" do
    @book.status = " "
    assert_not @book.valid?
  end

  # LENGTH

  test "author should not be too long" do
    @book.author = "a" * 31
    assert_not @book.valid?
  end

  test "description should not be too long" do
    @book.description = "a" * 256
    assert_not @book.valid?
  end

  # UNIQUE

  test "ISBN addresses should be unique" do
    duplicate_book = @book.dup
    @book.save
    assert_not duplicate_book.valid?
  end

end
