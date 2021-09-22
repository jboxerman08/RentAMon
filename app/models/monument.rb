class Monument < ApplicationRecord
has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :coordinates, presence: true

end
