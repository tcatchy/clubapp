json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :body, :club_id, :user_id
  json.url announcement_url(announcement, format: :json)
end
