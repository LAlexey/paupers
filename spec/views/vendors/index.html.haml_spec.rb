require 'rails_helper'

RSpec.describe "vendors/index", :type => :view do
  before(:each) do
    assign(:vendors, [
      Vendor.create!(
        :name => "Name",
        :permalink => "Permalink",
        :description => "MyText"
      ),
      Vendor.create!(
        :name => "Name",
        :permalink => "Permalink",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of vendors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Permalink".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
