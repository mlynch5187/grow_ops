require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john   = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)

    @garden1 = create(:garden, user_id: @john.id)

    visit '/dashboard'
  end

  it "can delete garden" do
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content(@garden1.name)

    click_on "Delete Garden"

    expect(current_path).to eq("/dashboard")
    expect(page).to_not have_content(@garden1.name)
  end
end
