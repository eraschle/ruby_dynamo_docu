require_relative 'node_context'

# parent class for all all possible dynamo nodes
class ZeroTouchContext < NodeContext

  def self.create(source)
    model_type = :ZeroTouchNode
    ZeroTouchContext.new model_type, source
  end

  def self.default_attributes
    attributes = {}
    attributes[:assembly] = 'assembly'
    attributes[:function] = 'function'
    attributes
  end

  def initialize(model_type = :ZeroTouchNode,
                 xml_type = 'Dynamo.Graph.Nodes.ZeroTouch.DSFunction',
                 attributes = ZeroTouchContext.default_attributes,
                 child_contexts = nil, excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end
end
