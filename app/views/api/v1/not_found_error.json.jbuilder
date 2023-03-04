# frozen_string_literal: true

json.status 404
json.errors do
  json.child! do
    json.title 'Not found'
    json.detail 'The requested record could not be found'
    json.source do
      json.pointer "/#{source_pointer_prefix}/id"
    end
  end
end
