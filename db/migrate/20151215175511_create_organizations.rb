class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :logo_id
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :name

      t.timestamps null: false
    end
  end
end
