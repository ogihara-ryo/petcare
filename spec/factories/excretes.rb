FactoryBot.define do
  factory :excrete do
    association :pet
    note { 'MyText' }
    datetime { '2019-01-01 00:00:00' }
  end
end
