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
    fill_in('First name', :with => "Billy")
    fill_in('Last name', :with => "Andrews")
    choose("Male")
    attach_file('person_photo', 'test/scottandlauren.png')
    select('Basketball', :from => 'Sport')
    select('1989', :from => 'Induction year')
    select('1987', :from => 'First active year')
    select('1989', :from => 'Last active year')
    check("All state 1st team")
    check("Hall of fame")
    click_on("Create Person")
    assert current_path== person_path(Person.last.id), "Person and record were not created"
  end

end
