json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :number, :price, :start_date, :end_date, :purchase_location, :description, :count
  json.url ticket_url(ticket, format: :json)
end
