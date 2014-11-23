class ServiceCategory < ActiveRecord::Base
  has_ancestry

  include JqTreeAncestry
end
