json.array!(@notes) do |note|
  json.extract! note, :id, :title, :description, :weather
  json.url note_url(note, format: :json)
end
