require 'rails_helper'

RSpec.describe "vendors/new", :type => :view do
  before(:each) do
    assign(:vendor, Vendor.new(
      :name => "MyString",
      :permalink => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new vendor form" do
    render

    assert_select "form[action=?][method=?]", vendors_path, "post" do

      assert_select "input#vendor_name[name=?]", "vendor[name]"

      assert_select "input#vendor_permalink[name=?]", "vendor[permalink]"

      assert_select "textarea#vendor_description[name=?]", "vendor[description]"
    end
  end
end
