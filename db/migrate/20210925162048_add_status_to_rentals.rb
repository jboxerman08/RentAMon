class AddStatusToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :status, :boolean, default: nil
  end
end
