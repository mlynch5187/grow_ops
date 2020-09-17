require 'rails_helper'

RSpec.describe "Plots Page", :vcr do
  before(:each) do
    stub_omniauth
    @john = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)
    visit '/users/gardens/new'

    fill_in "Name", with: "My new garden"
    fill_in "length_feet", with: 1
    fill_in "length_inches", with: 2
    fill_in "width_feet", with: 3
    fill_in "width_inches", with: 4
    fill_in "zip_code", with: "80503"
    fill_in "light", with: 6

    click_on("Create Garden")
  end

  it "plot page has attributes", :vcr do
    garden = Garden.last
    expect(current_path).to eq("/users/gardens/#{garden.id}/plants/new")
    expect(page).to have_content("Choose your favorites to get started!")
    expect(page).to have_button("Select Plants")

    within "#plant-176845" do
      check "plant[]"
    end

    click_button "Select Plants"

    within "#plant-176845" do
      expect(page).to have_content("Current Quantity: 0")
    end

    within "#plant-176845" do
      click_on("Increase Amount")
    end

    within "#plant-176845" do
      expect(page).to have_content("Current Quantity: 1")
    end

    within "#plant-176845" do
      click_on("Decrease Amount")
    end

    within "#plant-176845" do
      expect(page).to have_content("Current Quantity: 0")
    end
  end
end
