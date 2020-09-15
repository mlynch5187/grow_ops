require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)
    visit '/users/gardens/new'
  end

  it "can create a new garden" do
    fill_in "Name", with: "My new garden"
    fill_in "length_feet", with: 1
    fill_in "length_inches", with: 2
    fill_in "width_feet", with: 3
    fill_in "width_inches", with: 4
    fill_in "zip_code", with: "80503"
    fill_in "light", with: 6

    click_on("Create Garden")

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("My new garden")
    expect(page).to have_link("Add plants to garden")
  end

  it "can add plants to a new garden" do
    fill_in "Name", with: "My new garden"
    fill_in "length_feet", with: 1
    fill_in "length_inches", with: 2
    fill_in "width_feet", with: 3
    fill_in "width_inches", with: 4
    fill_in "zip_code", with: "80111"
    fill_in "light", with: 6

    click_on("Create Garden")

    garden = Garden.last

    within ".garden-#{garden.id}" do
      click_on("Add plants to garden")
    end

    expect(current_path).to eq("/users/gardens/#{garden.id}/plants/new")

    expect(page).to have_content("We've randomly selected 50 plants that will grow in your garden")
    within(first(".plants")) do
      find(:css, "#plant-").set(true)
    end
    click_button "Create Garden"

    expect(page).to have_css(".plants")

    expect(page).to have_content("Remaining plot size:")
    expect(page).to have_button("Add Plants to Garden")
  end

  it "if user does not select any plants" do

  end
end
