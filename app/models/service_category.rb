class ServiceCategory < ActiveRecord::Base
  has_ancestry
  include JqTreeAncestry

  scope :nested_set,          -> { order(:position)  }
  scope :reversed_nested_set, -> { order(positon: :desc) }
end
