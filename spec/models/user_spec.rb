# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without an email' do
    user = User.new(valid_attributes.merge(email_address: nil))
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = User.new(valid_attributes.merge(password: nil))
    expect(user).to_not be_valid
  end

  it 'is invalid with an invalid email' do
    user = User.new(valid_attributes.merge(email_address: 'invalidemail'))
    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
    User.create(valid_attributes)
    user = User.new(valid_attributes)
    expect(user).to_not be_valid
  end

  it 'is invalid with an email which is duplicated up to case' do
    User.create(valid_attributes)
    user = User.new(valid_attributes.merge(email_address: valid_attributes[:email_address].upcase))
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.new(valid_attributes)
    expect(user).to be_valid
  end

  def valid_attributes
    FactoryBot.attributes_for(:user)
  end
end
