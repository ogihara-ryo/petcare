require 'rails_helper'

RSpec.feature 'pets/1/excretes/new', type: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }

  background do
    visit pet_excretes_path(pet.id)
    first(:link, 'New').click
  end

  context 'when you input enable values' do
    background do
      fill_in 'Note', with: '順調に成長中!'
      fill_in 'Datetime', with: '2019/08/18 10:18:45'
      click_on 'Create Excrete'
    end

    scenario 'it is created' do
      expect(current_path).to eq pet_excretes_path(pet)
      expect(page).to have_text 'Excrete was successfully created.'
      expect(page).to have_text 'アルク'
      expect(page).to have_text '順調に成長中!'
      expect(page).to have_text '2019-08-18 10:18:45'
    end
  end
end
