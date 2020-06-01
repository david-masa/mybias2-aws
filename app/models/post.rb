class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  validates :reason, presence: true, unless: :video?

  mount_uploader :video, ImageUploader
end
