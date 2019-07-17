require 'rails_helper'

RSpec.feature 'pets/1/physicals/index', type: :system do
  given!(:pet) { FactoryBot.create(:pet, user: FactoryBot.create(:user), name: 'アルク') }
  given!(:physical1) { FactoryBot.create(:physical, pet: pet, height: 20, weight: 0.6, date: '2019/05/30') }
  given!(:physical2) { FactoryBot.create(:physical, pet: pet, height: 40, weight: 0.9, date: '2019/06/20') }
  given!(:physical3) { FactoryBot.create(:physical, pet: pet, height: 30, weight: 0.8, date: '2019/06/12') }

  background do
    visit pet_physicals_path(pet)
  end

  scenario 'it desplay order by created_at desc in default' do
    expect(records[0].text).to have_text '2019-06-20'
    expect(records[1].text).to have_text '2019-06-12'
    expect(records[2].text).to have_text '2019-05-30'
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
