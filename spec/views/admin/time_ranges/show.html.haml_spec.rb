require 'rails_helper'

RSpec.describe "admin/time_ranges/show", :type => :view do
  before(:each) do
    @admin_time_range = assign(:admin_time_range, Admin::TimeRange.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
