class AddColumnsToMonuments < ActiveRecord::Migration[6.0]
  def change
    add_column :monuments, :description, :string
    add_column :monuments, :coordinates, :float
  end
end
