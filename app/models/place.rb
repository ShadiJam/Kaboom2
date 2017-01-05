class Place < ApplicationRecord

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [title, street, city, state, country].compact.join(', ')
  end

end
