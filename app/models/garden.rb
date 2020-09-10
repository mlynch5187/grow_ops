class Garden < ApplicationRecord
  validates :name, presence: true
  validates :square_feet, presence: true
  validates :location, presence: true

  # has_many :plants
end
