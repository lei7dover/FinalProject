class Person < ActiveRecord::Base
  has_many :records, inverse_of: :person
  belongs_to :organization
  attachment :photo
  accepts_nested_attributes_for :records
  validates_presence_of :first_name, :last_name, :gender

  def self.search(search)
    where("LOWER(first_name) ILIKE ? OR LOWER(last_name) ILIKE ? ", "%#{search}%", "%#{search}%") || where("LOWER(first_name) and " " and LOWER(last_name) ILIKE ?", "%#{search}%")
  end

  scope :by_organization_filter, -> (org) {where("people.organization_id" => org)}

  scope :records_sport_pluck, -> {joins(:records).pluck("Distinct records.sport").sort}
  scope :records_sport_filter, -> (sport) { joins(:records).where("records.sport" => sport) }

  scope :people_last_name_pluck, -> {pluck("Distinct people.last_name").sort}
  scope :people_last_name_filter, -> (last_name) { where("people.last_name" => last_name) }

  scope :people_class_of_pluck, -> {where("people.class_of IS NOT NULL").pluck("Distinct people.class_of").sort}
  scope :people_class_of_filter, -> (class_of) { where("people.class_of" => class_of) }

  scope :records_all_state_1st_team_pluck, -> {joins(:records).pluck("Distinct records.all_state_1st_team")}
  scope :records_all_state_1st_team_filter, -> (all_state_1st_team) { where("records.all_state_1st_team" => all_state_1st_team) }
  scope :records_all_state_2nd_team, -> (all_state_2nd_team) { where("records.all_state_2nd_team" => all_state_2nd_team) }
  scope :records_all_state_3rd_team, -> (all_state_3rd_team) { where("records.all_state_3rd_team" => all_state_3rd_team) }
  scope :records_hall_of_fame, -> (hall_of_fame) { where("records.hall_of_fame" => hall_of_fame) }


end
