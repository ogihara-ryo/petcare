FactoryBot.define do
  factory :pet do
    association :user
    name { 'MyString' }
    race { 'MyString' }
    sex { true }
    birthday { '2000-05-05' }
    greeted_on { '2000-06-11' }
    note { 'MyText' }
    # TODO: thumbnail {}
    color { 'MyString' }
  end
end
