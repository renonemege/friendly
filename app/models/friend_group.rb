class FriendGroup < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  validates :price, :description, :title, :address, presence: true
end
