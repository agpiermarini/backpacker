class DestinationImage < ApplicationRecord
  belongs_to :image
  belongs_to :destination 
end
