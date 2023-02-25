# frozen_string_literal: true

class User < ApplicationRecord
  validates :email_address, presence: true, uniqueness: true, email: true

  scope :with_email_address_like, ->(email_address) { where('email_address LIKE ?', "%#{email_address}%") }
end
