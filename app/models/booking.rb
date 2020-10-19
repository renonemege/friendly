class Booking < ApplicationRecord
  belongs_to :friend_group
  belongs_to :user
  has_many :reviews
  validates :status, :start_date, :end_date, :status, :total_price, presence: true
end
