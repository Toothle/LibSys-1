require 'test_helper'

class MembersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Member.count' do
      post members_path, member: { name: "",
                                   email: "member@invalid",
                                   password: "foo"}
   end
   assert_template 'members/new'
   end
   test "valid signup information" do
     get signup_path
     assert_difference "Member.count", 1 do
       post_via_redirect members_path, member: {name: "Example Member",email: "member@example.com",password:"password"}
     end
     assert_template 'members/show'
     assert is_logged_in?
   end
end
