class Picture < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 30 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
