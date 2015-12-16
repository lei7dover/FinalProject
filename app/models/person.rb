class Person < ActiveRecord::Base
  has_many :records
  attachment :photo
  accepts_nested_attributes_for :record
end
