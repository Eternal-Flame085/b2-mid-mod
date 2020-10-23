class AmusementPark < ApplicationRecord
  has_many :rides

  def thrill_average
    self.rides.average(:thrill_rating)
  end
end
