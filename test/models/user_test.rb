require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user_create" do
    user = build(:user)
    assert user.save, "User was not created"
  end

  test "validates name for user" do
    user = build(:user, :name => "")
    assert_not user.save, "User Saved without name"
  end

  test "validates email for user" do
    user = build(:user, :email => "")
    assert_not user.save, "User Saved without email"
  end

end
