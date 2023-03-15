# frozen_string_literal: true

class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email_address, presence: true, uniqueness: true, email: true

  scope :with_email_address_like, ->(email_address) { where('email_address LIKE ?', "%#{email_address}%") }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
