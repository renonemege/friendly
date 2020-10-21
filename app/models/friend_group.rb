class FriendGroup < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :price, :description, :title, :address, presence: true


end
