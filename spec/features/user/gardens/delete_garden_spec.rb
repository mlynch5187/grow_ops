require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john   = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)

    @garden1 = create(:garden, user_id: @john.id)
    @garden2 = create(:garden, user_id: @john.id)
    @garden3 = create(:garden, user_id: @john.id)
    @garden4 = create(:garden, user_id: @john.id)

    visit '/dashboard'
  end

  it "can delete garden" do
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content(@garden1.name)
    expect(page).to have_content(@garden2.name)
    expect(page).to have_content(@garden3.name)
    expect(page).to have_content(@garden4.name)

    within ".garden-#{@garden1.id}" do
      expect(page).to have_link("Delete Garden")
    end
    expect(page).to_not have_content(@garden1.name)

    within ".garden-#{@garden2.id}" do
      expect(page).to have_link("Delete Garden")
    end
    expect(page).to_not have_content(@garden2.name)
  end
end
