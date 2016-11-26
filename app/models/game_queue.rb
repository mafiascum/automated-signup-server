# Games are sorted by characteristics into queues
class GameQueue < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 64}
  validates :description, presence: true, length: {maximum: 128}
  validates :forum_id, presence: true, uniqueness: true
end
