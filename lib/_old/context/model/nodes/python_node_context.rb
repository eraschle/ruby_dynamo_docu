# frozen_string_literal: true

require_relative 'node_context'
require_relative '../../config/a_config'
require_relative '../common/code_context'

# parent class for all all possible dynamo nodes
class PythonNodeContext < NodeContext
  def self.build_script_symbol
    key_suffix = 'python_script'
    AConfig.create_build_symbol key_suffix
  end

  def self.default_attributes
    attributes = {}
    attributes[:input_count] = 'inputcount'
    attributes[:code] = PythonNodeContext.build_script_symbol
    attributes
  end

  def self.default_child_contexts
    child = {}
    key = PythonNodeContext.build_script_symbol
    child[key] = CodeContext.new
    child
  end

  def self.create(source)
    model_type = :PythonNode
    PythonNodeContext.new model_type, source
  end

  def initialize(model_type = :PythonNode,
                 xml_type = 'PythonNodeModels.PythonNode',
                 attributes = PythonNodeContext.default_attributes,
                 child_contexts = PythonNodeContext.default_child_contexts,
                 excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end
end
