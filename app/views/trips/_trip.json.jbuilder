json.extract! trip, :id, :start_date, :end_date, :trip_name, :created_at, :updated_at
json.url trip_url(trip, format: :json)