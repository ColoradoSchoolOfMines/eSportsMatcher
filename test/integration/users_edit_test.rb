require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test_user)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar",
                                              summoner_name: "rupert" } }

    assert_template 'users/edit'
  end

  test "edit valid summoner_name should result in a new summoner" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    riot_schmick = "RiotSchmick"
    patch user_path(@user), params: { user: { name: @user.name,
                                             email: @user.email,
                                             password: "password",
                                             password_confirmation: "password",
                                             summoner_name: riot_schmick } }
    assert_redirected_to @user, "redirect to user"
    assert_equal @user.summoner_name, riot_schmick
    assert_not @user.summoner.nil?, "summoner is not nil"
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path @user
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "",
                                              summoner_name: "Darshan" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
