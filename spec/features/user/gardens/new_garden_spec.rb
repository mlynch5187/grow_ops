require 'rails_helper'

RSpec.describe 'As a logged in user' do
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

  it "can create a new garden" do
    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("My new garden")
    expect(page).to have_link("Add plants to garden")
  end

  # it "can add plants to a new garden" do
  #   garden = Garden.last
  #
  #   within ".garden-#{garden.id}" do
  #     click_on("Add plants to garden")
  #   end
  #
  #   expect(current_path).to eq("/users/gardens/#{garden.id}/plants/new")
  #   expect(page).to have_content("We've randomly selected 50 plants that will grow in your garden")
  #
  #   within(first(".plants")) do
  #     check "plant"
  #   end
  #   # within(first(".card")) do
  #   #   check "plant"
  #   # end
  #
  #   click_button "Select Plants"
  #
  #   expect(current_path).to eq("/users/gardens/#{garden.id}/plants/plot")
  # end

  it "if user does not select any plants" do
    garden = Garden.last
    within ".garden-#{garden.id}" do
      click_on("Add plants to garden")
    end

    expect(current_path).to eq("/users/gardens/#{garden.id}/plants/new")
    click_button "Select Plants"

    expect(current_path).to eq("/users/gardens/#{garden.id}/plants/new")
    expect(page).to have_content("Please select plants to add to your garden")
  end
end
