class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :friend_group, through: :bookings
end
