json.array!(@magic_card_names) do |magic_card_name|
  json.extract! magic_card_name, :id, :name
  json.url magic_card_name_url(magic_card_name, format: :json)
end
