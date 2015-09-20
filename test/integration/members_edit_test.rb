require 'test_helper'

class MembersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @member = members(:michael)
  end

  test "unsuccessful edit" do
    get edit_member_path(@member)
    assert_template 'members/edit'
    patch member_path(@member), member: { name:  "",
                                    email: "foo@invalid",
                                    password:              "foo"}
    assert_template 'members/edit'
  end   
end
