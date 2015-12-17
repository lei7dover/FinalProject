class User < ActiveRecord::Base
  has_one :organization
  validates_presence_of :name, :email
end
