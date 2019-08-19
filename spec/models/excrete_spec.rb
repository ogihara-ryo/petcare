require 'rails_helper'

RSpec.describe Excrete, type: :model do
  describe '.belong_to' do
    let(:excrete) { FactryBot.create(:excrete, pet: pet) }

    describe 'pet' do
      let(:pet){ FactryBot.create(:pet, user: FactryBot.create(:user), name: 'spica') }
      before { excrete.pet = pet }
      it { expect(excrete.pet).to eq pet }
    end
  end
end
