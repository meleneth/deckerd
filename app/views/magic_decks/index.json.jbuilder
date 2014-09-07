json.array!(@magic_decks) do |magic_deck|
  json.extract! magic_deck, :id, :name, :description
  json.url magic_deck_url(magic_deck, format: :json)
end
