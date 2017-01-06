class Place < ApplicationRecord

  geocoded_by :full_address
  after_validation :geocode, :if => :full_address_changed?

  def full_address
    [title, street, city, state, country].compact.join(', ')
  end

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
