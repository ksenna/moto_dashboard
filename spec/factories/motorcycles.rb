FactoryGirl.define do
  factory :motorcycle do
    sequence(:name) { |n| "Moto #{n}" }
    description "This bike is awesome!"
  end
end
