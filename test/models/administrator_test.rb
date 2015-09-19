require 'test_helper'

class AdministratorTest < ActiveSupport::TestCase

  def setup
    @administrator = Administrator.new(name: "Example admin",
                                       email: "admin@example.com")
  end

  test "should be valid" do
    assert @administrator.valid?
  end


end
