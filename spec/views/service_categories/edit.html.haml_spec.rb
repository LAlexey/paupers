require 'rails_helper'

RSpec.describe "service_categories/edit", :type => :view do
  before(:each) do
    @service_category = assign(:service_category, ServiceCategory.create!())
  end

  it "renders the edit service_category form" do
    render

    assert_select "form[action=?][method=?]", service_category_path(@service_category), "post" do
    end
  end
end
