class Plant < ApplicationRecord
  # validates :id
  # validates :name
  # validates :row_spacing
  # validates :spread
  # validates :edible
  # validates :images
  # validates :light
  # validates :ph_min
  # validates :ph_max
  # validates :days_to_harvest
  # validates :min_temp
  # validates :max_temp
  # validates :link_to_show_page
  validates :garden_id, presence: true

  belongs_to :garden
end
