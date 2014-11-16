require 'rails_helper'

RSpec.describe "vendors/edit", :type => :view do
  before(:each) do
    @vendor = assign(:vendor, Vendor.create!(
      :name => "MyString",
      :permalink => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit vendor form" do
    render

    assert_select "form[action=?][method=?]", vendor_path(@vendor), "post" do

      assert_select "input#vendor_name[name=?]", "vendor[name]"

      assert_select "input#vendor_permalink[name=?]", "vendor[permalink]"

      assert_select "textarea#vendor_description[name=?]", "vendor[description]"
    end
  end
end
