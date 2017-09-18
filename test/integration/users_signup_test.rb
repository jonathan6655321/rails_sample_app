require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "should not generate user with invalid information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "should display error explanation for invalid input" do
    get signup_path
    post users_path, params: { user: { name:  "",
                                       email: "user@invalid",
                                       password:              "foo",
                                       password_confirmation: "bar" } }

    assert_select 'div#error_explanation'
    asser_select 'div.alert'
  end


end
