require 'test_helper'

class DeviseTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    Warden.test_mode!
  end

  test "register new user" do
    user = User.create! name: 'Joe', email: 'foo@example.com', password: 'mypassword', password_confirmation: 'mypassword', country: 'USA', city: 'NY', email: 'joe@peacecorps.gov', email_confirmation: 'joe@peacecorps.gov', role: 'volunteer'
    user.confirmed_at = Time.zone.now
    login_as(user, :scope => :user)

    get root_path
    assert_redirected_to root_path
  end
end
