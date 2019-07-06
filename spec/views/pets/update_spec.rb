require 'rails_helper'

RSpec.feature 'pets/edit/1', type: :system do
  given!(:user) { FactoryBot.create(:user) }
  given!(:pet1) { FactoryBot.create(:pet) }

  background do
    visit pets_path
    first(:link, 'Edit').click
  end

  context 'when you input enable values' do
    background do
      fill_in 'Name', with: 'アルク'
      fill_in 'Race', with: '猫'
      fill_in 'Birthday', with: '2019/5/5'
      fill_in 'Greeted on', with: '2019/6/11'
      fill_in 'Note', with: "毛色: 茶白\n瞳の色: イエロー\n茶トラ系 わんぱく甘えん坊 オス"
      fill_in 'Color', with: '#ffd900'
      click_on 'Update Pet'
    end

    scenario 'it is updated' do
      expect(current_path).to eq pet_path(pet1)
      expect(page).to have_text 'Pet was successfully updated.'
      expect(page).to have_text 'アルク'
      expect(page).to have_text '猫'
      expect(page).to have_text '2019-05-05'
      expect(page).to have_text '2019-06-11'
      expect(page).to have_text "毛色: 茶白\n瞳の色: イエロー\n茶トラ系 わんぱく甘えん坊 オス"
      expect(page).to have_text '#ffd900'
    end
  end
end
