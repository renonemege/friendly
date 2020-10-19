class Booking < ApplicationRecord
  belongs_to :friend_group
  belongs_to :user
  has_many :reviews
end
