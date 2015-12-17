require 'test_helper'

class PersonRecordTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "Person & record can be created in one sweep" do
    user = build(:user)
    password = Faker::Internet.password
    user.password = password
    user.password_confirmation = password
    user.save!
    visit(new_person_path)
    fill_in('First Name', :with => person.first_name)
    fill_in('Last Name', :with => person.last_name)
    choose("Male")
    attach_file('Image', '/path/to/image.jpg')
    select('Basketball', :from => 'Sport')
    fill_in("Induction Year", :with => person.induction_year)
    fill_in("First Active Year", :with => person.first_active_year)
    fill_in("Last Active Year", :with => person.last_active_year)
    check("All State 1st Team")
    check("Hall of fame")
    click_on("Create Person")
    assert current_url== person_path, "Person and record were not created"
  end

end
