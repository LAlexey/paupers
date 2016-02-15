require 'rails_helper'

RSpec.describe "admin/time_ranges/edit", :type => :view do
  before(:each) do
    @admin_time_range = assign(:admin_time_range, Admin::TimeRange.create!())
  end

  it "renders the edit admin_time_range form" do
    render

    assert_select "form[action=?][method=?]", admin_time_range_path(@admin_time_range), "post" do
    end
  end
end
