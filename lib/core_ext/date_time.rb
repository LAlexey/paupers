class DateTime
  def round_half_hour
    change(min: (min / 30) * 30)
  end
end
