class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :friend_group, through: :bookings
  validates :content, :stars, presence: true
end
