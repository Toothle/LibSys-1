require 'test_helper'

class MembersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @member = members(:michael)
  end

  test "login with invalid information" do
   get login_path
   assert_template 'se2sions/new'
   post login_path, se2sion: {email: "", password: ""}
   assert_template 'se2sions/new'
   assert_not flash.empty?
   get root_path
   assert flash.empty?
 end

end
