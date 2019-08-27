require 'rails_helper'

RSpec.describe Note, type: :model do
  describe '.belong_to' do
    let(:note) { FactoryBot.create(:note, pet: pet) }

    describe 'pet' do
      let(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'spica') }
      before { note.pet = pet }
      it { expect(note.pet).to eq pet }
    end
  end
end
