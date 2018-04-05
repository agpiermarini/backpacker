class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :destinations, dependent: :destroy
end
