class Record < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :bio, :sport, :first_active_year, :last_active_year
end
