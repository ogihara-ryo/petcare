require 'rails_helper'

RSpec.describe Excrete, type: :model do
  describe '.belong_to' do
    let(:excrete) { FactoryBot.create(:excrete, pet: pet) }

    describe 'pet' do
      let(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'spica') }
      before { excrete.pet = pet }
      it { expect(excrete.pet).to eq pet }
    end
  end
end
