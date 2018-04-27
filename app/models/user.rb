class User < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
