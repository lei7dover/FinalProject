FactoryGirl.define do
  factory :user do
    name "Tim Smith"
    email "tsmith@fakeemail.com"
    password "password"
    password_confirmation "password"
  end

end
