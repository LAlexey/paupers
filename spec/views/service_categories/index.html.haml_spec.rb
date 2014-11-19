require 'rails_helper'

RSpec.describe "service_categories/index", :type => :view do
  before(:each) do
    assign(:service_categories, [
      ServiceCategory.create!(),
      ServiceCategory.create!()
    ])
  end

  it "renders a list of service_categories" do
    render
  end
end
