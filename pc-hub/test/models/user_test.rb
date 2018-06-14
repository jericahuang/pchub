class UserTest < ActiveSupport::TestCase
  test  "shouldn't allow non-peacecorps.gov email" do
    user = User.new(email: 'asdfjkl@gmail.com')
    assert_not user.valid?
    assert_equal ["Must be a peacecorps.gov account"], user.errors.messages[:email]
  end

  test  "shouldn't allow peacecorps.gov email without username" do
    user = User.new(email: '@peacecorps.gov')
    assert_not user.valid?
    assert_equal ["Invalid Email", "Must be a peacecorps.gov account"], user.errors.messages[:email]
  end

  test  "shouldn't allow trailing chars after peacecorps.gov" do
    user = User.new(email: 'asdf@peacecorps.govn')
    assert_not user.valid?
    assert_equal ["Must be a peacecorps.gov account"], user.errors.messages[:email]
  end

  test  "shouldn't allow invalid e-mail" do
    user = User.new(email: 'asdf')
    assert_not user.valid?
    assert_equal ["Invalid Email", "Must be a peacecorps.gov account"], user.errors.messages[:email]
  end

  test  "should allow peacecorps.gov email" do
    user = User.new(email: 'hello@peacecorps.gov')
    assert_empty user.errors[:email]
  end
end
