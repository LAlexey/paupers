class TimeRange < ActiveRecord::Base
  belongs_to :item, polymorphic: true

  composed_of :during,
    class_name: '::BoundTime',
    converter: :build,
    mapping: %w(during range)

  scope :overlaps, ->(range) { where('during && ?', BoundTime.build(range)) }

  def overlaps?(range)
    time = BoundTime.build(range)
    during.overlaps?(time)
  end
end
