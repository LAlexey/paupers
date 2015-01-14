class RequestForm < FormObject
  attribute :date,    Date
  attribute :time,    Time
  attribute :comment, String

  validates :date, :time, presence: true

  protected

  def scalar_attributes
    [:comment]
  end

  def complex_attributes
    {
      time: DateTime.new(date.year, date.month, date.day, time.hour, time.min)
    }
  end

  def mapped_attributes
    attributes.slice(*scalar_attributes).merge(complex_attributes)
  end

  def persist
    r = Request.new(mapped_attributes)
    r.save
    r
  end
end
