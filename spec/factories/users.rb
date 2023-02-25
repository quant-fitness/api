# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email_address { 'user.email@something.org' }
  end
end
