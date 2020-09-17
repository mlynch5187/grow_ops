require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)
    visit '/dashboard'
  end

  it "on my dashboard I see a header with user email, app info, log out button" do    
    expect(page).to have_content("#{@john.email}")
    expect(page).to have_content("What will you grow today?")
    expect(page).to have_link("Logout")
  end

  it "shows a button to create a new garden" do
    expect(page).to have_link("Create a New Garden")
    click_on("Create a New Garden")

    expect(current_path).to eq("/users/gardens/new")

    expect(page).to have_content("Create a New Garden")
    expect(page).to have_field("Name")
    expect(page).to have_field("length_feet")
    expect(page).to have_field("length_inches")
    expect(page).to have_field("width_feet")
    expect(page).to have_field("width_inches")
    expect(page).to have_field("zip_code")
  end
end
