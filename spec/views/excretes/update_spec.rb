require 'rails_helper'

RSpec.feature 'pets/1/excretes/edit/1', typpe: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }
  given!(:excrete1) { FactoryBot.create(:excrete, pet: pet) }

  background do
    visit pet_excretes_path(pet.id)
    first(:link, 'Edit').click
  end

  context 'when you input enable values' do
    background do
      fill_in 'Note', with: '順調に成長中!'
      fill_in 'Datetime', with: '2019/08/18 10:18:45'
      click_on 'Update Excrete'
    end

    scenario 'it is update' do
      expect(current_path).to eq pet_excrete_path(pet, excrete1)
      expect(page).to have_text 'Excrete was successfully updated.'
      expect(page).to have_text 'アルク'
      expect(page).to have_text '順調に成長中!'
      expect(page).to have_text '2019-08-18 10:18:45'
    end
  end
end
