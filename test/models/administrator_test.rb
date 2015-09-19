require 'test_helper'

class AdministratorTest < ActiveSupport::TestCase

  def setup
    @administrator = Administrator.new(name: "Example admin",
                                       email: "admin@example.com",
                                       password: "foobar")
  end

  test "should be valid" do
    assert @administrator.valid?
  end

  test "name should be present" do
    @administrator.name = " "
    assert_not @administrator.valid?
  end

  test "email should be present" do
    @administrator.email= " "
    assert_not @administrator.valid?
  end

  test "name should not be too long" do
    @administrator.name = "a" * 51
    assert_not @administrator.valid?
  end

  test "email should not be too long" do
    @administrator.email = "a" * 256
    assert_not @administrator.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                             first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @administrator.email = valid_address
      assert @administrator.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                               foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @administrator.email = invalid_address
      assert_not @administrator.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_administrator = @administrator.dup
    duplicate_administrator.email = @administrator.email.upcase
    @administrator.save
    assert_not duplicate_administrator.valid?
  end


  test "password should have a minimum length" do
    @administrator.password = "a" * 5
    assert_not @administrator.valid?
  end


end
