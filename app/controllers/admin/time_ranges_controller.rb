class Admin::TimeRangesController < Admin::BaseController
  def index
    @time_ranges = TimeRange.all
  end
end
