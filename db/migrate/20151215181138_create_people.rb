class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :photo_id

      t.timestamps null: false
    end
  end
end
