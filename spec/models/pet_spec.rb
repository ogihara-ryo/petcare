require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe '.belongs_to' do
    let(:pet) { FactoryBot.create(:pet, user: user, name: 'spica') }

    describe 'user' do
      let(:user) { FactoryBot.create(:user, nickname: 'Ryo') }
      before { pet.user = user }
      it { expect(pet.user).to eq user }
    end
  end
end
