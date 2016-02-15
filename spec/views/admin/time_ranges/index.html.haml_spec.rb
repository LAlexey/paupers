require 'rails_helper'

RSpec.describe "admin/time_ranges/index", :type => :view do
  before(:each) do
    assign(:admin_time_ranges, [
      Admin::TimeRange.create!(),
      Admin::TimeRange.create!()
    ])
  end

  it "renders a list of admin/time_ranges" do
    render
  end
end
