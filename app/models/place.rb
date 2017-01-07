class Place < ApplicationRecord
  belongs_to :trip
  
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?

  def full_address
    [title, street, city, state, country].compact.join(', ')
  end

  reverse_geocoded_by :lat, :lon do |obj,results|
  if geo = results.first
    obj.city    = geo.city
    obj.zipcode = geo.postal_code
    obj.country = geo.country_code
  end
end
after_validation :reverse_geocode

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      place_hash = row.to_hash
      place = Place.where(id: place_hash["id"])

      if place.count == 1
        place.first.update!(place_hash)
      else
        Place.create!(place_hash)
      end
    end
  end



end
