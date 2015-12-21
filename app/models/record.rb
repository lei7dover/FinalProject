class Record < ActiveRecord::Base
  belongs_to :person, inverse_of: :records
  validates_presence_of :bio, :sport, :first_active_year, :last_active_year, :person_id
end
