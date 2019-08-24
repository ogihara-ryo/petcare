FactoryBot.define do
  factory :note do
    association :pet
    body { 'MyText' }
    datetime { '2019-01-01 00:00:00' }
  end
end
