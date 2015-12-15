class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :person_id
      t.integer :induction_year
      t.integer :first_active_year
      t.integer :last_active_year
      t.text :bio
      t.string :sport

      t.timestamps null: false
    end
  end
end
