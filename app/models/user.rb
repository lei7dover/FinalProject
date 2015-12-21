class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :email
  end
  has_one :organization
  validates_presence_of :name, :email
end
