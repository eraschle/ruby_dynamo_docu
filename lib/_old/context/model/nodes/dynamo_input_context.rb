# frozen_string_literal: true

require_relative 'node_context'
require_relative '../../config/a_config'
require_relative '../common/system_type_context'

# parent class for all all possible dynamo nodes
class DynamoInputContext < NodeContext
  def self.merge_symbol_system_value
    key_suffix = 'system_value'
    AConfig.create_merge_symbol key_suffix
  end

  def self.merge_symbol_system_type
    key_suffix = 'system_type'
    AConfig.create_merge_symbol key_suffix
  end

  def self.default_attributes
    attributes = {}
    attributes[:input_value] = DynamoInputContext.merge_symbol_system_value
    attributes[:input_type] = DynamoInputContext.merge_symbol_system_type
    attributes
  end

  def self.default_child_contexts
    child = {}
    key = DynamoInputContext.merge_symbol_system_value
    child = DynamoInputContext.add_child(child, key, :xml_inner_value)
    key = DynamoInputContext.merge_symbol_system_type
    child = DynamoInputContext.add_child(child, key, :xml_element_name)
    child
  end

  def self.add_child(map, key, value = nil)
    map[key] = SystemTypeContext.create_system key, value
    map
  end

  def self.create(source, exclude)
    model_type = :DynamoNodeInput
    attributes = DynamoInputContext.default_attributes
    children = DynamoInputContext.default_child_contexts
    DynamoInputContext.new model_type, source, attributes, children, exclude
  end

  def initialize(model_type = :DynamoNodeInput,
                 source_type = 'CoreNodeModels.Input',
                 attributes = DynamoInputContext.default_attributes,
                 child_contexts = DynamoInputContext.default_child_contexts,
                 excluded = [])
    super model_type, source_type, attributes, child_contexts, excluded
    @starts_with = "#{@source}."
  end

  def of_source?(element)
    !excluded?(element) && element.to_s.start_with?(@starts_with)
  end

  def excluded?(element)
    @excluded.find_all { |ele| element.to_s.end_with? ele }.count > 0
  end
end
