require 'rails_helper'

describe Garden, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :length_cm }
    it { should validate_presence_of :width_cm }
    it { should validate_presence_of :zip_code }
    it { should validate_presence_of :light }
  end

  describe "relationships" do
    it {should belong_to :user}
    it {should have_many :plants}
  end

  describe "methods" do
    it "plot_size" do
      garden = create(:garden, length_cm: 10, width_cm: 10)
      expect(garden.plot_size).to eq(100)
    end
  end
end
