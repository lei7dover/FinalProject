require 'test_helper'

class UserSessionLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "User session can be created" do
    user = build(:user)
    password = Faker::Internet.password
    user.password = password
    user.password_confirmation = password
    user.save!
    visit(new_user_session_path)
    fill_in('Email', :with => "tsmith@fakeemail.com")
    fill_in('Password', :with => "password")
    click_on("Login")
    assert current_url == root_url, "User session was not created"
  end

end
