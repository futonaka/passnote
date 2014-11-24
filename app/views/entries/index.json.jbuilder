json.array!(@entries) do |entry|
  json.extract! entry, :id, :note_id, :integer, :author_id, :integer, :weather, :string, :date, :string, :body, :text
  json.url entry_url(entry, format: :json)
end
