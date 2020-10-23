require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relations' do
    it {should have_many :rides}
  end
end
