require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

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
    assert_select 'div.alert'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user) # :user corresponds to the user controller.
    assert_not user.activated?

    # should not be logged in without activation
    assert_not is_logged_in?
    # should not allow login without activation:
    log_in_as user
    assert_not is_logged_in?
    # should not activate with invalid token:
    get edit_account_activation_url("invalid token", email: user.email)
    assert_not user.activated?
    assert_not is_logged_in?
    # or with invalid email
    get edit_account_activation_url(user.activation_token, email: "invalid@mail.com")
    assert_not user.activated?
    assert_not is_logged_in?
    # after successful activation: updated in db, redirect to users/show
    get edit_account_activation_url(user.activation_token, email: user.email)
    assert user.reload.activated? # from db!
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
