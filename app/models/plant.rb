class Plant < ApplicationRecord
  # validates :id, presence: true
  # validates :name, presence: true
  # validates :row_spacing, presence: true
  # validates :spread, presence: true
  # validates :edible, presence: true
  # validates :images, presence: true
  # validates :light, presence: true
  # validates :ph_min, presence: true
  # validates :ph_max, presence: true
  # validates :days_to_harvest, presence: true
  # validates :min_temp, presence: true
  # validates :max_temp, presence: true
  # validates :link_to_show_page, presence: true
  validates :garden_id, presence: true

  belongs_to :garden
end
