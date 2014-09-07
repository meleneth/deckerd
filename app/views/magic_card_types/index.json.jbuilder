json.array!(@magic_card_types) do |magic_card_type|
  json.extract! magic_card_type, :id, :name
  json.url magic_card_type_url(magic_card_type, format: :json)
end
