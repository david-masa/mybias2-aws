class GenreUser < ApplicationRecord
  belongs_to :genre
  belongs_to :user
end
