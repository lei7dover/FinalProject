class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :person_id
      t.integer :induction_year
      t.integer :first_active_year
      t.integer :last_active_year
      t.text :bio
      t.string :sport
      t.string :all_state_1st_team
      t.string :all_state_2nd_team
      t.string :all_state_3rd_team
      t.string :hall_of_fame

      t.timestamps null: false
    end
  end
end
