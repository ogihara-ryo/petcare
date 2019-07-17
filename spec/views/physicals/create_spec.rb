require 'rails_helper'

RSpec.feature 'pets/1/physicals/new', type: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }

  background do
    visit pet_physicals_path(pet.id)
    first(:link, 'New').click
  end

  context 'when you input enable values' do
    background do
      fill_in 'Height', with: '40'
      fill_in 'Weight', with: '0.9'
      fill_in 'Note', with: '順調に成長中！'
      fill_in 'Date', with: '2019/06/12'
      click_on 'Create Physical'
    end

    scenario 'it is created' do
      expect(current_path).to eq pet_physicals_path(pet)
      expect(page).to have_text 'Physical was successfully created.'
      expect(page).to have_text 'アルク'
      expect(page).to have_text '40.0'
      expect(page).to have_text '0.9'
      expect(page).to have_text '順調に成長中！'
      expect(page).to have_text '2019-06-12'
    end
  end
end
