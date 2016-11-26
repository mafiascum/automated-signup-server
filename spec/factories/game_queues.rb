FactoryGirl.define do
  factory :game_queue do
    sequence(:name) { |n| "Queue #{n}" }
    sequence(:forum_id) { |n| n }
  end
end
