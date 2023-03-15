# frozen_string_literal: true

json.key_format! camelize: :lower

if @current_user.nil?
  json.data nil
else
  json.data do
    json.email_address @current_user.email_address
  end
end
