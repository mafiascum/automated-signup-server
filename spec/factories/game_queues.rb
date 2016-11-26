FactoryGirl.define do
  factory :game_queue do
    sequence(:name) { |n| "Queue #{n}" }
    description { FFaker::Lorem.sentence }
    sequence(:forum_id) { |n| n }
  end
end
