require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)
    visit '/user'
  end

  it "on my dashboard I see a header with user email, app info, log out button" do

    within("#main-nav") do
      expect(page).to have_content("Welcome #{@john.email}")
      expect(page).to have_content("Grow Ops: What Will You Grow Today?")
      expect(page).to have_link("Logout")
    end
  end

  it "shows a button to create a new garden" do
    expect(page).to have_button("Create a new garden")
    click_on("Create a new garden")

    expect(current_path).to eq("/user/gardens/new")

    expect(page).to have_content("Create a New Garden")
    expect(page).to have_field("Name")
    expect(page).to have_field("length")
    expect(page).to have_field("width")
    expect(page).to have_content("Zip Code")
  end
end
