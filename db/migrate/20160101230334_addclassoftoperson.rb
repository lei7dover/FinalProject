class Addclassoftoperson < ActiveRecord::Migration
  def change
    add_column :people, :class_of, :integer
  end
end
