class DestinationImage < ApplicationRecord
  belongs_to :image
  belongs_to :destination

  validates :image,       presence: true, uniqueness: { scope: :destination }
  validates :destination, presence: true
end
