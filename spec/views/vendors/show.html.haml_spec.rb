require 'rails_helper'

RSpec.describe "vendors/show", :type => :view do
  before(:each) do
    @vendor = assign(:vendor, Vendor.create!(
      :name => "Name",
      :permalink => "Permalink",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Permalink/)
    expect(rendered).to match(/MyText/)
  end
end
