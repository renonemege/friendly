class Booking < ApplicationRecord
  after_validation :update_total

  belongs_to :friend_group
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :status, :start_date, :end_date, presence: true

  private

  def update_total
    self.total_price = ((end_date - start_date).to_i * friend_group.price.to_i).to_s
  end
end
