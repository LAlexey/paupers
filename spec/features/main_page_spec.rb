require 'rails_helper'

RSpec.describe 'main', js: true do
  feature 'available' do
    scenario "check elements" do
      visit '/'

      expect(page).to have_current_path(root_path)
    end
  end
end
