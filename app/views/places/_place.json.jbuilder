json.extract! place, :id, :title, :address, :latitude, :longitude, :type, :city, :street, :country, :state, :created_at, :updated_at
json.url place_url(place, format: :json)