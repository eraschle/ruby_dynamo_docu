require_relative 'node_context'

# parent class for all all possible dynamo nodes
class CoreNodeModelContext < NodeContext

  def initialize(model_type = :Node,
                 source_type = 'CoreNodeModels',
                 attributes = NodeContext.default_node_attributes,
                 child_contexts = nil,
                 excluded = ['CoreNodeModels.Input'])
    super model_type, source_type, attributes, child_contexts, excluded
    @starts_with = "#{@source}."
  end

  def of_source?(element)
    !excluded?(element) && element.to_s.start_with?(@starts_with)
  end

  def excluded?(element)
    @excluded.find_all { |ele| element.to_s.start_with? ele }.count > 0
  end
end
