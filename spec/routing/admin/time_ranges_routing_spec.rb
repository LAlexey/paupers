require "rails_helper"

RSpec.describe Admin::TimeRangesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/time_ranges").to route_to("admin/time_ranges#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/time_ranges/new").to route_to("admin/time_ranges#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/time_ranges/1").to route_to("admin/time_ranges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/time_ranges/1/edit").to route_to("admin/time_ranges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/time_ranges").to route_to("admin/time_ranges#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/time_ranges/1").to route_to("admin/time_ranges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/time_ranges/1").to route_to("admin/time_ranges#destroy", :id => "1")
    end

  end
end
