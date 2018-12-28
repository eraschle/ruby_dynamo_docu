require_relative 'node_context'


# parent class for all all possible dynamo nodes
class CodeBlockContext < NodeContext

  def self.create(source)
    model_type = :CodeBlockNode
    CodeBlockContext.new model_type, source
  end

  def self.default_attributes
    attributes = {}
    attributes[:code] = 'CodeText'
    attributes
  end

  def initialize(model_type = :CodeBlockNode,
                 xml_type = 'Dynamo.Graph.Nodes.CodeBlockNodeModel',
                 attributes = CodeBlockContext.default_attributes,
                 child_contexts = nil, excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end

end
