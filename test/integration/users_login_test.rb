require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "flash persists only on login page after fail" do
    get login_path
    assert_select 'form.new_user'
    assert_template 'sessions/new'
    params = { session: {
        email: "abc",
        password: "abc" } }
    post login_path params
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end
