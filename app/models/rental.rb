class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :monument

  validates :date_of_delivery, presence: true
  validates :date_of_return, presence: true

end
