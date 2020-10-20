class Booking < ApplicationRecord
  belongs_to :friend_group, dependent: :destroy
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :status, :start_date, :end_date, :total_price, presence: true
end
