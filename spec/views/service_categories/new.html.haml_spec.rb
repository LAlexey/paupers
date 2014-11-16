require 'rails_helper'

RSpec.describe "service_categories/new", :type => :view do
  before(:each) do
    assign(:service_category, ServiceCategory.new())
  end

  it "renders new service_category form" do
    render

    assert_select "form[action=?][method=?]", service_categories_path, "post" do
    end
  end
end
