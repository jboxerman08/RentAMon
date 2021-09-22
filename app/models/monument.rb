class Monument < ApplicationRecord
has_many_attached :pictures
  validates :name, presence: true
  validates :description, presence: true
  validates :coordinates, presence: true

end
