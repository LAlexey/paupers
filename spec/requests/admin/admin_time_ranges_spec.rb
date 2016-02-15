require 'rails_helper'

RSpec.describe "Admin::TimeRanges", :type => :request do
  describe "GET /admin_time_ranges" do
    it "works! (now write some real specs)" do
      get admin_time_ranges_path
      expect(response.status).to be(200)
    end
  end
end
