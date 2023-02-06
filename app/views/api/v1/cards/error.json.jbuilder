json.errors @object.errors do |error|
  json.code "unprocessable_entity"
  json.status @status_code
  json.title "Validation Error"
  json.detail error.full_message
  json.source do
    json.pointer "/data/attributes/#{@object.errors.attribute_names.first.to_s}"
  end

  json.meta do
    json.attribute @object.errors.attribute_names.first.to_s
    json.message error.message
    json.code error.type.to_s
  end
end
