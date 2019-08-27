require 'rails_helper'

Rspec.feature 'pets/1/notes/edit/1', type: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }
  given!(:note1) { FactoryBot.create(:note, pet: :pet) }

  background do
    visit pet_notes_path(pet.id)
    first(:link, 'Edit').click
  end

  context 'when you input enable values' do
    background do
      fill_in 'Body', with: '順調に成長中!'
      fill_in 'Datetime', with: '2019/08/18 10:18:45'
      click_on 'Update Note'
    end

    scenario 'it is updated' do
      expect(current_path). to eq pet_note_path(pet, note1)
      expect(page).to have_text 'Note was successfully updated.'
      expext(page).to have_text 'アルク'
      expect(page).to have_text '順調に成長中!'
      expect(page).to have_text '2019-08-18 10:18:45'
    end
  end
end
