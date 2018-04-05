class Destination < ApplicationRecord
  belongs_to :country
  belongs_to :user

  has_many :destination_images, dependent: :destroy
  has_many :images, through: :destination_images
end
