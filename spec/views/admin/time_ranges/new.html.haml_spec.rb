require 'rails_helper'

RSpec.describe "admin/time_ranges/new", :type => :view do
  before(:each) do
    assign(:admin_time_range, Admin::TimeRange.new())
  end

  it "renders new admin_time_range form" do
    render

    assert_select "form[action=?][method=?]", admin_time_ranges_path, "post" do
    end
  end
end
