class AddUserToMonuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :monuments, :user, null: false, foreign_key: true
  end
end
