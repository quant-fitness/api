# frozen_string_literal: true

json.errors errors do |error|
  json.title error.detail[:error]
  json.detail error.full_message
  json.source do
    json.pointer "/#{source_pointer_prefix}/#{error.attribute}"
  end
end
