class Monument < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :coordinates, presence: true

end
