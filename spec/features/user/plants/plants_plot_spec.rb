require 'rails_helper'

RSpec.describe "Plots Page" do
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
    # @garden1 = create(:garden, user_id: @john.id, zip_code: 80502)
    # @garden1 = create(:garden, user_id: @john.id, zip_code: 80111)
  end

  xit "plot page has attributes" do
    garden = Garden.last
    # within "#checkbox-#{pet_1.id}" do
    #   check "applied_for_"
    # end
    # check 'plant'
    # check 'plant'
    # check 'plant'
    # check 'plant'
    click_button "Select Plants"
    expect(current_path).to eq("/users/gardens/#{garden.id}/plants/plot")

    expect(page).to have_content("You've chosen your plants, now place them!")
    expect(page).to have_content("Remaining plot size:")
    expect(page).to have_content("Select the number of each plant desired")
    expect(page).to have_button("Increase Amount")
    expect(page).to have_button("Decrease Amount")
    expect(page).to have_button("Create Garden")

    expect(current_path).to eq("/users/gardens/#{garden.id}/plants/plot")
  end
end
