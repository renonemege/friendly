class Review < ApplicationRecord
  belongs_to :booking
  validates :content, :stars, presence: true
end
