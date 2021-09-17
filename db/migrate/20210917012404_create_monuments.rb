class CreateMonuments < ActiveRecord::Migration[6.0]
  def change
    create_table :monuments do |t|
      t.string :name
      t.boolean :availability
      t.integer :price

      t.timestamps
    end
  end
end
