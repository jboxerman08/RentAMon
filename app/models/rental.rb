class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :monument
    # monument cannot be blank
  validates :monument_id, allow_blank: false, presence: true
  # user cannot be blank
  validates :user_id, allow_blank: false, presence: true
  # is unique for a given user/monument couple
  validates :monument_id, uniqueness: { scope: :user_id }
end
