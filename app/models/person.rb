class Person < ActiveRecord::Base
  has_many :records, inverse_of: :person
  belongs_to :organization
  attachment :photo
  accepts_nested_attributes_for :records
  validates_presence_of :first_name, :last_name, :gender

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? ", "%#{search}%", "%#{search}%") || where("first_name and " " and last_name LIKE ?", "%#{search}%")
  end

  def self.sport(sport)
    where("sport LIKE ? ", "%#{search}%")
  end

end
