require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)
    visit '/user/gardens/new'
  end

  it "can create a new garden" do
    fill_in "name", with: "My new garden"
    fill_in "length", with: "My new garden"
  end
end
