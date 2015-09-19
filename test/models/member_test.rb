require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @member = Member.new(name: "Example Member", email: "member@example.com", password: "foobar")
  end

  test "should be valid" do
    assert @member.valid?
  end

  test "name should be present" do
    @member.name = ""
    assert_not @member.valid?
  end

  test "email should be present" do
    @member.email = "     "
    assert_not @member.valid?
  end

  test "name should not be too long" do
    @member.name = "a" * 51
    assert_not @member.valid?
  end

  test "email should not be too long" do
    @member.email = "a" * 244 + "@example.com"
    assert_not @member.valid?
  end
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @member.email = valid_address
      assert @member.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @member.email = invalid_address
      assert_not @member.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "email addresses should be unique" do
    duplicate_member = @member.dup
    duplicate_member.email = @member.email.upcase
    @member.save
    assert_not duplicate_member.valid?
  end
  test "password should be present (nonblank)" do
    @member.password = @member.password = " " * 6
    assert_not @member.valid?
  end

  test "password should have a minimum length" do
    @member.password = @member.password = "a" * 5
    assert_not @member.valid?
  end
end
