class Organization < ActiveRecord::Base
  has_many :people
  belongs_to :user
  attachment :logo
  attachment :org_photo
  validates_presence_of :name
end
