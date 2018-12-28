require_relative '../node_context'

# parent class for all all possible dynamo nodes
class MultiInputNodeContext < NodeContext

  def self.default_attributes
    attributes = {}
    attributes[:input_count] = 'inputcount'
    attributes
  end

  def self.create(source)
    model_type = :MultiInputNode
    MultiInputNodeContext.new model_type, source
  end

  def initialize(model_type = :MultiInputNode,
                 xml_type = 'CoreNodeModels.CreateList',
                 attributes = MultiInputNodeContext.default_attributes,
                 child_contexts = nil, excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end

  def model_value(model_attr, value)
    return value unless model_attr == :input_count
    ParseHelper.string_to_int value
  end

end
