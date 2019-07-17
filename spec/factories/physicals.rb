FactoryBot.define do
  factory :physical do
    association :pet
    height { 30.5 }
    weight { 0.9 }
    note { 'MyText' }
    date { '2019-01-01' }
  end
end
