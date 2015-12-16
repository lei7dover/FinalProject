class Organization < ActiveRecord::Base
  has_many :people
  belongs_to :user
  attachment :logo
end
