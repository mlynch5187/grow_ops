require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    stub_omniauth
    @john = create(:omniauth_mock_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@john)

  end

  it "on my dashboard I see a header with user email, app info, log out button" do
    visit '/user'

    within("#main-nav") do
      expect(page).to have_content("Welcome #{@john.email}")
      expect(page).to have_content("Grow Ops: What Will You Grow Today?")
      expect(page).to have_link("Logout")
    end
  end
end
