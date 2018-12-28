require_relative 'node_context'

# parent class for all all possible dynamo nodes
class FunctionNodeContext < NodeContext

  def self.merge_id_symbol
    key_suffix = 'function_id'
    AConfig.create_merge_symbol key_suffix
  end

  def self.merge_name_symbol
    key_suffix = 'function_name'
    AConfig.create_merge_symbol key_suffix
  end

  def self.merge_description_symbol
    key_suffix = 'function_description'
    AConfig.create_merge_symbol key_suffix
  end

  def self.default_attributes
    attributes = {}
    attributes[:function_id] = FunctionNodeContext.merge_id_symbol
    attributes[:function_name] = FunctionNodeContext.merge_name_symbol
    attributes[:description] = FunctionNodeContext.merge_description_symbol
    attributes
  end

  def self.default_child_contexts
    child = {}
    key = FunctionNodeContext.merge_id_symbol
    child[key] = SymbolContext.create 'ID', key
    key = FunctionNodeContext.merge_name_symbol
    child[key] = SymbolContext.create 'Name', key
    key = FunctionNodeContext.merge_description_symbol
    child[key] = SymbolContext.create 'Description', key
    child
  end

  def self.create(source)
    model_type = :FunctionNode
    FunctionNodeContext.new model_type, source
  end

  def initialize(model_type = :FunctionNode,
                 xml_type = 'Dynamo.Nodes.Function',
                 attributes = FunctionNodeContext.default_attributes,
                 child_contexts = FunctionNodeContext.default_child_contexts,
                 excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end
end
