class Monument < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :rentals
  has_many_attached :photos

  validates :name, presence: true
  validates :availability, presence: true
  validates :price, presence: true
  validates :description, presence: true
  # validates :coordinates, presence: true not needed as we have longitude and latitude now
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :description, length: { maximum: 450, too_long: "%{count} characters is the maximum allowed" }
  validates :price, numericality: { only_float: true }
  validates :photos, presence:true  
end
