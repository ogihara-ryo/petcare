require 'rails_helper'

RSpec.feature 'pets/1/notes/index', type: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }
  given!(:note1) { FactoryBot.create(:note, pet: pet, datetime: '2019/08/18 10:18:45') }
  given!(:note2) { FactoryBot.create(:note, pet: pet, datetime: '2019/08/10 10:18:45') }
  given!(:note3) { FactoryBot.create(:note, pet: pet, datetime: '2019/08/08 10:18:45') }

  background do
    visit pet_notes_path(pet)
  end

  scenario 'it desplay order by created_at desc in default' do
    expect(records[0].text).to have_text '2019-08-18 10:18:45'
    expect(records[1].text).to have_text '2019-08-10 10:18:45'
    expect(records[2].text).to have_text '2019-08-08 10:18:45'
  end

  scenario 'it is able to destroy' do
    first(:link, 'Destroy').click
    page.driver.browser.switch_to.alert.accept
    visit current_path
    expect(records.count).to eq 2
  end

  def records
    all('tbody tr')
  end
end
