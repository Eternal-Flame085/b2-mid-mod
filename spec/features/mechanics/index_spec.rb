require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a mechanics index page' do
    it "has a header saying 'All Mechanics'" do
      visit '/mechanics'

      expect(page).to have_content('All Mechanics')
    end

    it "Has a list of all mechanics names and years of experience" do
      mechanic_1 = Mechanic.create({name: 'John', years_of_experience: 6})
      mechanic_2 = Mechanic.create({name: 'Alex', years_of_experience: 10})

      visit '/mechanics'

      within(id="#mechanic-#{mechanic_1.id}") do
        expect(page).to have_content("Name: #{mechanic_1.name}")
        expect(page).to have_content("Years of Experience: #{mechanic_1.years_of_experience}")
      end

      within(id="#mechanic-#{mechanic_2.id}") do
        expect(page).to have_content("Name: #{mechanic_2.name}")
        expect(page).to have_content("Years of Experience: #{mechanic_2.years_of_experience}")
      end
    end
  end
end
