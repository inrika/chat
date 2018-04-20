class User < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true
  has_many :visitors
  has_many :rooms, through: :visitors
  has_many :messages
end
