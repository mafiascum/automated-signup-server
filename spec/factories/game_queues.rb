FactoryGirl.define do
  factory :game_queue do
    sequence(:name) { |n| "Queue #{n}" }
    forum_id 1
  end
end
