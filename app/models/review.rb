class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  validates :content, :stars, presence: true
end
