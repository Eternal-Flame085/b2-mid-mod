require 'rails_helper'

describe 'As a visitor' do
  describe  'When i visit an amusement parks show page' do
    it "I see the name and price of admissions for that amusement park" do
      park_1 = AmusementPark.create({name: "AOA", admission_price: 35})
      ride_1 = Ride.create({name: 'test', thrill_rating: 8, amusement_park_id: park_1.id})

      visit "/amusement_parks/#{park_1.id}"

      expect(page).to have_content("#{park_1.name}")
      expect(page).to have_content("Admission: $#{park_1.admission_price}")
    end

    it "I see the names of all the rides at that park" do
      park_1 = AmusementPark.create({name: "AOA", admission_price: 35})
      ride_1 = Ride.create({name: 'test', thrill_rating: 8, amusement_park_id: park_1.id})

      visit "/amusement_parks/#{park_1.id}"

      within(id="#rides") do
        expect(page).to have_content("1. #{ride_1.name}")
      end
    end

    it "I see the average thrill rating for rides" do
      park_1 = AmusementPark.create({name: "AOA", admission_price: 35})
      ride_1 = Ride.create({name: 'test', thrill_rating: 8, amusement_park_id: park_1.id})
      ride_2 = Ride.create({name: 'testing', thrill_rating: 10, amusement_park_id: park_1.id})

      visit "/amusement_parks/#{park_1.id}"

      expect(page).to have_content("Average Thrill Rating of Rides: #{park_1.thrill_average}/10")
    end
  end
end
