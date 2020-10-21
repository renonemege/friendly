class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :login, :email, presence: true

  before_validation :ensure_login_has_a_value
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings

  private

  def ensure_login_has_a_value
    if login.nil?
      self.login = email unless email.blank?
    end
  end
end
