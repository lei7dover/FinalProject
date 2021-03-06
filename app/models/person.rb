class Person < ActiveRecord::Base
  has_many :records, inverse_of: :person
  belongs_to :organization
  attachment :photo
  accepts_nested_attributes_for :records, allow_destroy: true
  validates_presence_of :first_name, :last_name, :gender
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  def full_name
    first_name + " " + last_name
  end

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ? OR ((first_name || ' ' || last_name) ILIKE  ?)", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  scope :by_organization_filter, -> (org) {joins(:organization).where("organizations.slug" => org)}

  scope :records_sport_pluck, -> {joins(:records).pluck("Distinct records.sport").sort}
  scope :records_sport_filter, -> (sport) { joins(:records).where("records.sport" => sport) }

  scope :people_last_name_pluck, -> {pluck("Distinct people.last_name").sort}
  scope :people_last_name_filter, -> (last_name) { where("people.last_name" => last_name) }

  scope :people_class_of_pluck, -> {where("people.class_of IS NOT NULL").pluck("Distinct people.class_of").sort}
  scope :people_class_of_filter, -> (class_of) { where("people.class_of" => class_of) }


  scope :records_all_state_1st_team_filter, -> (xyz) { joins(:records).where("records.all_state_1st_team" => xyz).uniq }


  scope :records_all_state_2nd_team_filter, -> (xyz) { joins(:records).where("records.all_state_2nd_team" => xyz).uniq }


  scope :records_all_state_3rd_team_filter, ->  (xyz) { joins(:records).where("records.all_state_3rd_team" => xyz).uniq }

  scope :records_hall_of_fame_filter, -> (xyz) { joins(:records).where("records.hall_of_fame" => xyz).uniq }


end
