class RemoveCoordinatesFromMonuments < ActiveRecord::Migration[6.0]
  def change
    remove_column :monuments, :coordinates, :float
  end
end
