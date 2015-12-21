class AddUserIdtoOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :user_id, :integer
    add_column :organizations, :phone_number, :string
    add_column :organizations, :org_photo_id, :string
  end
end
