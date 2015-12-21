class Person < ActiveRecord::Base
  has_many :records, inverse_of: :person
  belongs_to :organization
  attachment :photo
  accepts_nested_attributes_for :records
  validates_presence_of :first_name, :last_name, :gender
end
