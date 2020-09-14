class Garden < ApplicationRecord
  validates  :name, presence: true
  validates  :length_cm, presence: true
  validates  :width_cm, presence: true
  validates  :zip_code, presence: true
  validates  :light, presence: true

  belongs_to :user
  has_many   :plants

  def plot_size
    length_cm * width_cm
  end
end
