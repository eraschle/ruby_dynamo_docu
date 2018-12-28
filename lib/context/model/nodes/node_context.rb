require_relative '../a_context'

# parent class for all all possible dynamo nodes
class NodeContext < AContext

  def self.default_node_attributes
    attr = {}
    attr[:uid] = 'guid'
    attr[:title] = 'nickname'
    attr[:xml_type] = 'type'
    attr[:lacing] = 'lacing'
    attr[:frozen] = 'IsFrozen'
    attr[:visible] = 'isVisible'
    attr[:selected_input] = 'isSelectedInput'
    attr
  end

  def self.create(source)
    model_type = :Node
    attributes, children, excluded = nil
    NodeContext.new model_type, source, attributes, children, excluded
  end

  def initialize(model_type, xml_type, attributes, child_context, excluded)
    super model_type, xml_type, add_common(attributes), child_context, excluded
  end

  private

  def add_common(attributes)
    attr = attributes.nil? ? {} : attributes
    attr.merge(NodeContext.default_node_attributes)
  end
end
