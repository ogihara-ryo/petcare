FactoryBot.define do
  factory :pet do
    association :user
    name { 'MyString' }
    race { 'MyString' }
    birthday { '2000-05-05' }
    greeted_on { '2000-06-11' }
    note { 'MyText' }
    # thumbnail {}
    color { 'MyString' }
  end
end
