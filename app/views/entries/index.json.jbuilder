json.array!(@entries) do |entry|
  json.extract! entry, :id, :note_id, :author_id, :weather, :date, :body
  json.url entry_url(entry, format: :json)
end
