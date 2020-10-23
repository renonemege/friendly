class Booking < ApplicationRecord
  after_validation :update_total

  belongs_to :friend_group
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :status, :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def update_total
    self.total_price = ((end_date - start_date).to_i * friend_group.price.to_i).to_s
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
