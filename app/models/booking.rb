class Booking < ApplicationRecord
  before_save :update_total

  belongs_to :friend_group
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :status, :start_date, :end_date, :total_price, presence: true

  private

  def update_total
    friend_group = FriendGroup.where(booking_id: id)
    self.total_price = (end_date - start_date).to_i * friend_group.price
  end
end
