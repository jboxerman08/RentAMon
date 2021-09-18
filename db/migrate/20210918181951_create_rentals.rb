class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :monument, null: false, foreign_key: true
      t.datetime :date_of_delivery
      t.datetime :date_of_return

      t.timestamps
    end
  end
end
