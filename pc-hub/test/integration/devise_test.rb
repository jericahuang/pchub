require 'test_helper'

class DeviseTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    Warden.test_mode!
  end

  test "logged in message" do
    get root_path
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_select 'h2', 'Log in'
  end

  test "register new user" do
    user = User.create! name: 'Joe', email: 'foo@example.com', password: '12345678', country: 'USA', city: 'NY', email: 'joe@peacecorps.gov', role: 'volunteer'
    exception = assert_raises(Exception) {login_as(user, :scope => :user)}
    #user.confirmed_at = Time.zone.now
    login_as(user, :scope => :user)

    get root_path
    assert_equal root_path, current_path
    assert_select 'h1', 'Welcome, foo@example.com!'
  end
end
