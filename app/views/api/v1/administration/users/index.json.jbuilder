# frozen_string_literal: true

json.key_format! camelize: :lower

json.data do
  json.array! @users, :id, :email_address, :created_at, :updated_at
end
