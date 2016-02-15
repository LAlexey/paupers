class BoundTime
  ZERO = '0'
  RANGE_SPLIT = '-'

  attr_reader :range

  class << self
    # build("14:15-15:30")
    def build(range)
      range = range.split(RANGE_SPLIT) if String === range

      new to_int_bound(range.first)...to_int_bound(range.last)
    end

    private

    # converts formatted time strings like "14:30"
    # to number
    # Examples
    # "14:30" -> 1430
    # "00:01" -> 1
    # "01:00" -> 100
    def to_int_bound(formatted_time)
      if String === formatted_time
        hour, min = /(\d+):(\d+)/.match(formatted_time).values_at(1, 2).map(&:to_i)
      else
        hour  = formatted_time / 100
        min   = formatted_time % 100
      end

      raise "Invalid hour value".freeze if hour < 0 || hour > 23
      raise "Invalid min value".freeze  if min < 0  || min > 59

      hour * 100 + min
    end
  end

  delegate :first, :last, :cover?, :overlaps?, to: :range

  def initialize(range)
    @range = range
  end

  def from
    to_formatted_time(left_bound)
  end

  def to
    to_formatted_time(right_bound)
  end

  def to_s
    "#{from}-#{to}"
  end

  def to_db
    "[#{left_bound},#{right_bound})"
  end

  def quoted_id
    "'#{to_db}'"
  end

  private

  # to_formatted_time(1014) -> "10:14"
  # to_formatted_time(14)   -> "00:14"
  # to_formatted_time(5)    -> "00:05"
  def to_formatted_time(int_bound)
    hour  = (int_bound / 100).to_s.rjust(2, ZERO)
    min   = (int_bound % 100).to_s.rjust(2, ZERO)

    "#{hour}:#{min}"
  end

  def left_bound
    range.first
  end

  def right_bound
    range.last
  end
end
