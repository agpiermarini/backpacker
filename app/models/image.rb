class Image < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true

  has_many :destination_images, dependent: :destroy
end
