# Represents forum users in the rails database
# User.id should be the user's forum id
class User < ApplicationRecord
  enum role: [:player, :listmod, :admin]
  has_secure_token :token

  validates :role, presence: true
end
