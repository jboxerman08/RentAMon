class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :monument

  validates :date_of_delivery, presence: true
  validates :date_of_return, presence: true
  validates :monument_id, allow_blank: false, presence: true
  validates :user_id, allow_blank: false, presence: true
  
  def approve
    self.status = true
  end

  def decline
    self.status = false
  end
end
