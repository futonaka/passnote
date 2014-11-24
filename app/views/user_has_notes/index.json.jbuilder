json.array!(@user_has_notes) do |user_has_note|
  json.extract! user_has_note, :id
  json.url user_has_note_url(user_has_note, format: :json)
end
