class Genre < ApplicationRecord
  has_many :genre_users
  has_many :users, through: :genre_users
  has_many :posts
  validates :name, presence: true, uniqueness: true
end
