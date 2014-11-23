module JqTreeAncestry
  extend ActiveSupport::Concern

  #TODO on include check ancestry

  module ClassMethods
    def full_jqtree_json
      to_jqtree_json(arrange).to_json
    end

    protected
    def to_jqtree_json(nodes)
      nodes.map do |root, subnodes|
        r = {
          label: root.title
        }

        r[:children] = to_jqtree_json(subnodes) if subnodes.any?

        r
      end
    end
  end
end
