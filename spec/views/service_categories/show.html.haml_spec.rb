require 'rails_helper'

RSpec.describe "service_categories/show", :type => :view do
  before(:each) do
    @service_category = assign(:service_category, ServiceCategory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
