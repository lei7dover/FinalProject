class User < ActiveRecord::Base
  has_one :organization
end
