require 'rails_helper'

RSpec.feature 'pets/1/physicals/edit/1', type: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }
  given!(:physical1) { FactoryBot.create(:physical, pet: pet) }

  background do
    visit pet_physicals_path(pet.id)
    first(:link, 'Edit').click
  end

  context 'when you input enable values' do
    background do
      fill_in 'Height', with: '40'
      fill_in 'Weight', with: '0.9'
      fill_in 'Note', with: '順調に成長中！'
      fill_in 'Date', with: '2019/06/12'
      click_on 'Update Physical'
    end

    scenario 'it is updated' do
      expect(current_path).to eq pet_physicals_path(pet)
      expect(page).to have_text 'Physical was successfully updated.'
      expect(page).to have_text 'アルク'
      expect(page).to have_text '40.0'
      expect(page).to have_text '0.9'
      expect(page).to have_text '順調に成長中！'
      expect(page).to have_text '2019-06-12'
    end
  end
end
