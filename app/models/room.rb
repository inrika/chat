class Room < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :visitors
  has_many :users, through: :visitors
  has_many :messages
end
