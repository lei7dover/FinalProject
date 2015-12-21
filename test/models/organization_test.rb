require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test "organization_create" do
  organization = build(:organization)
  assert organization.save, "Organization was not created"
end

test "validates name for an organization" do
  organization = build(:organization, :name => "")
  assert_not organization.save, "Organization saved without a name"
end

end
