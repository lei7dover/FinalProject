require 'test_helper'

class UserSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "usersession_create" do
    user_session = build(:user_session)
    assert user_session.save, "User session was not created"
  end

end
