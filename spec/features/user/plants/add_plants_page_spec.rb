require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john   = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)
    @garden1 = create(:garden, user_id: @john.id)
  end

  it "can go to an add plants to garden page" do
    visit '/dashboard'
    within ".garden-#{@garden1.id}" do
      click_link "Add plants to garden"
    end
    expect(current_path).to eq("/user/gardens/#{@harden1.id}/plants/new")
  end
end
