require 'rails_helper'

RSpec.feature 'pets/index', type: :system do
  given!(:user) { FactoryBot.create(:user) }
  given!(:pet1) do
    FactoryBot.create(:pet,
                      user: user, name: 'アルク', race: '猫', birthday: '2019/5/5', greeted_on: '2019/6/11',
                      note: "毛色: 茶白\n瞳の色: イエロー\n茶トラ系 わんぱく甘えん坊 オス", color: '#ffd900')
  end
  given!(:pet2) do
    FactoryBot.create(:pet,
                      user: user, name: 'スピカ', race: '猫', birthday: '2019/5/5', greeted_on: '2019/6/11',
                      note: "毛色: 灰青\n瞳の色: イエロー\nロシアンブルー系 お嬢様 メス", color: '#5654a2')
  end
  given!(:pet3) do
    FactoryBot.create(:pet,
                      user: user, name: 'リア', race: '猫', birthday: '2019/5/5', greeted_on: '2019/6/11',
                      note: "毛色: 黒橙\n瞳の色: イエロー\n黒錆系 大和撫子 メス", color: '#f08300')
  end

  background do
    visit pets_path
  end

  scenario 'it desplay order by created_at desc in default' do
    expect(records[0].text).to have_text 'リア'
    expect(records[1].text).to have_text 'スピカ'
    expect(records[2].text).to have_text 'アルク'
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
