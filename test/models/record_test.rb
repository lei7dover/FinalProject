require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates bio for record" do
    record = build(:record, :bio => "")
    assert_not record.save, "Record saved without a bio"
  end

  test "validates sport for record" do
    record = build(:record, :sport => "")
    assert_not record.save, "Record saved without a sport declared"
  end

  test "validates first active year for record" do
    record = build(:record, :first_active_year => "")
    assert_not record.save, "Record saved without first active year declared"
  end

  test "validates last active year for record" do
    record = build(:record, :last_active_year => "")
    assert_not record.save, "Record saved without last active year declared"
  end

end
