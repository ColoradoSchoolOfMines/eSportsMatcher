require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "ESportsMatcher"
  end

  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "Register | #{@base_title}" 
  end

end
