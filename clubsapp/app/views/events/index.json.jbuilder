json.array!(@events) do |event|
  json.extract! event, :id, :name, :event_type, :event_time, :location, :description, :image1, :image2, :image3
  json.url event_url(event, format: :json)
end
