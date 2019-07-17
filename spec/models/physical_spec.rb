require 'rails_helper'

RSpec.describe Physical, type: :model do
  describe '.belongs_to' do
    let(:physical) { FactoryBot.create(:physical, pet: pet) }

    describe 'pet' do
      let(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'spica') }
      before { physical.pet = pet }
      it { expect(physical.pet).to eq pet }
    end
  end
end
