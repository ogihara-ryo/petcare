require 'rails_helper'

Rspec.feature 'pets/1/notes/new', type: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }

  background do
    visit pet_notes_path(pet.id)
    first(:link, 'New').click
  end
  
  context 'when you input enable values' do
    background do
      fill_in 'Body', with: '順調に成長中!'
      fill_in 'Datetime', with: '2019/08/18 10:18:45'
      click_on 'Create Note'
    end
    
    scenario 'it is created' do
      note(current_path).to eq pet_excretes_path(pet)
      note(page).to have_text 'Excrete was successfully created.'
      note(page).to have_text 'アルク'
      note(page).to have_text '順調に成長中!'
      note(page).to have_text '2019-08-18 10:18:45'
    end
  end
end
