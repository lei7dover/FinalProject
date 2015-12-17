require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "person_create" do
    person = build(:person)
    assert person.save, "Person was not created"
  end

  test "validates first name for a person" do
    person = build(:person, :first_name => "")
    assert_not person.save, "Person saved without a first name"
  end

  test "validates last name for a person" do
    person = build(:person, :last_name => "")
    assert_not person.save, "Person saved without a last name"
  end

  test "validates gender for a person" do
    person = build(:person, :gender => "")
    assert_not person.save, "Person saved without gender specified"
  end

end
